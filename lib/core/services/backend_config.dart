import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ukkmate/core/constants/app_version.dart';

/// Configuration and service bridge for Backend (Firebase & Supabase).
///
/// Owns the Supabase client operations used by the app.
class BackendConfig {
  static final BackendConfig _instance = BackendConfig._internal();
  factory BackendConfig() => _instance;
  BackendConfig._internal();

  static bool _initialized = false;

  bool get isInitialized => _initialized;
  SupabaseClient get client => Supabase.instance.client;
  User? get currentUser => _initialized ? client.auth.currentUser : null;
  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;

  /// Configured backend providers
  final String primaryBackend = 'Supabase Database & Auth';
  final String secondaryBackend = 'Firebase Cloud Messaging & Analytics';

  /// Supabase client configuration. Keep RLS enabled for exposed tables.
  static const String supabaseUrl = 'https://hdqsxljcxlzbqqgpslgn.supabase.co';
  static const String supabasePublishableKey =
      'sb_publishable_QtZoSy-6HqOHeTi0hO0A0A_QhOKu2xe';

  static const String firebaseProjectId = 'ukkmate';
  String get appVersion => AppVersion.full;

  Future<void> initialize() async {
    if (_initialized) return;
    await Supabase.initialize(
      url: supabaseUrl,
      publishableKey: supabasePublishableKey,
    );
    _initialized = true;
  }

  Future<Map<String, dynamic>?> getCurrentProfile() async {
    final user = currentUser;
    if (user == null) return null;

    final profile = await client
        .from('users')
        .select()
        .eq('id', user.id)
        .maybeSingle();
    final avatarPath = profile?['avatar_path'] as String?;
    if (avatarPath != null) {
      profile!['avatar_url'] = await client.storage
          .from('avatars')
          .createSignedUrl(avatarPath, 300);
    }
    return profile;
  }

  Future<String> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await client.auth.signInWithPassword(email: email, password: password);
    final profile = await getCurrentProfile();
    if (profile == null) {
      throw StateError(
        'Profil akun belum tersedia. Jalankan migration signup Supabase.',
      );
    }
    return profile['role'] as String? ?? 'siswa';
  }

  Future<bool> registerUser({
    required String nisn,
    required String nama,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      throw ArgumentError('Konfirmasi kata sandi tidak cocok.');
    }
    if (password.length < 8) {
      throw ArgumentError('Kata sandi minimal 8 karakter.');
    }

    final response = await client.auth.signUp(
      email: email,
      password: password,
      data: {'nisn': nisn, 'nama': nama},
    );
    return response.session != null;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await client.auth.resetPasswordForEmail(email, redirectTo: _redirectUrl);
  }

  Future<bool> signInWithGoogle() {
    return client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: _redirectUrl,
    );
  }

  Future<void> signOut() => client.auth.signOut();

  Future<String> startExamSession() async {
    final user = currentUser;
    if (user == null) {
      throw StateError('Silakan masuk untuk memulai sesi ujian.');
    }
    final row = await client
        .from('exam_sessions')
        .insert({'user_id': user.id})
        .select('id')
        .single();
    return row['id'] as String;
  }

  Future<void> endExamSession({
    required String sessionId,
    required String status,
  }) async {
    final user = currentUser;
    if (user == null) throw StateError('Sesi akun tidak aktif.');
    if (!{'completed', 'abandoned'}.contains(status)) {
      throw ArgumentError.value(status, 'status', 'Status sesi tidak valid.');
    }
    await client
        .from('exam_sessions')
        .update({
          'finished_at': DateTime.now().toUtc().toIso8601String(),
          'status': status,
        })
        .eq('id', sessionId)
        .eq('user_id', user.id);
  }

  Future<void> updatePassword(String password) async {
    if (password.length < 8) {
      throw ArgumentError('Kata sandi minimal 8 karakter.');
    }
    await client.auth.updateUser(UserAttributes(password: password));
  }

  Future<List<Map<String, dynamic>>> fetchMaterials() async {
    final rows = await client
        .from('materials')
        .select()
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(rows);
  }

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final user = currentUser;
    if (user == null) throw StateError('Silakan masuk untuk melihat tugas.');

    final rows = await client
        .from('tasks')
        .select()
        .eq('user_id', user.id)
        .order('due_date');
    return List<Map<String, dynamic>>.from(rows);
  }

  Future<void> updateTaskStatus({
    required String taskId,
    required String status,
  }) async {
    final user = currentUser;
    if (user == null) {
      throw StateError('Silakan masuk untuk memperbarui tugas.');
    }
    if (!{'pending', 'in_progress', 'completed'}.contains(status)) {
      throw ArgumentError.value(status, 'status', 'Status tugas tidak valid.');
    }

    await client
        .from('tasks')
        .update({'status': status})
        .eq('id', taskId)
        .eq('user_id', user.id);
  }

  Future<String> uploadAvatar({
    required Uint8List bytes,
    required String extension,
    required String contentType,
  }) async {
    final user = currentUser;
    if (user == null) {
      throw StateError('Silakan masuk untuk mengunggah avatar.');
    }
    final normalizedExtension = extension.toLowerCase().replaceFirst('.', '');
    if (!{'jpg', 'jpeg', 'png', 'webp'}.contains(normalizedExtension)) {
      throw ArgumentError.value(
        extension,
        'extension',
        'Format avatar tidak didukung.',
      );
    }

    final path = '${user.id}/avatar.$normalizedExtension';
    await client.storage
        .from('avatars')
        .uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(upsert: true, contentType: contentType),
        );
    await client.from('users').update({'avatar_path': path}).eq('id', user.id);
    return path;
  }

  Future<String> uploadAssignment({
    required String taskId,
    required String fileName,
    required Uint8List bytes,
    required String contentType,
  }) async {
    final user = currentUser;
    if (user == null) throw StateError('Silakan masuk untuk mengunggah tugas.');
    final safeFileName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
    final path = '${user.id}/$taskId/$safeFileName';
    await client.storage
        .from('assignments')
        .uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(upsert: true, contentType: contentType),
        );
    await client
        .from('tasks')
        .update({'submission_path': path})
        .eq('id', taskId)
        .eq('user_id', user.id);
    return path;
  }

  Future<String> createStorageDownloadUrl({
    required String bucket,
    required String path,
  }) {
    if (!{'avatars', 'materials', 'assignments'}.contains(bucket)) {
      throw ArgumentError.value(bucket, 'bucket', 'Bucket tidak dikenal.');
    }
    return client.storage.from(bucket).createSignedUrl(path, 300);
  }

  String get connectionStatusText {
    return _initialized
        ? 'Supabase siap • ${AppVersion.name}'
        : 'Supabase belum diinisialisasi';
  }

  String get _redirectUrl =>
      kIsWeb ? Uri.base.origin : 'io.supabase.ukkmate://login-callback/';
}

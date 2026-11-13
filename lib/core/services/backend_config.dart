import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
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
  static final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  bool get isInitialized => _initialized;
  SupabaseClient get client => Supabase.instance.client;
  firebase_auth.User? get currentUser => _firebaseAuth.currentUser;
  Stream<firebase_auth.User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();

  /// Configured backend providers
  final String primaryBackend = 'Firebase Auth & Supabase Database';
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
      accessToken: () async {
        final user = _firebaseAuth.currentUser;
        return user == null ? null : await user.getIdToken();
      },
    );
    _initialized = true;
  }

  Future<Map<String, dynamic>?> getCurrentProfile({
    String? nisn,
    String? nama,
  }) async {
    final user = currentUser;
    if (user == null) return null;

    final existingProfile = await client
        .from('users')
        .select()
        .eq('firebase_uid', user.uid)
        .maybeSingle();
    late Map<String, dynamic> profile;
    if (existingProfile == null) {
      profile = await client
          .from('users')
          .insert({
            'firebase_uid': user.uid,
            'email': user.email,
            'nama': nama ?? user.displayName ?? '',
            if (nisn != null) 'nisn': nisn,
          })
          .select()
          .single();
    } else {
      final updates = <String, dynamic>{};
      profile = Map<String, dynamic>.from(existingProfile);
      if (user.email != null && profile['email'] != user.email) {
        updates['email'] = user.email;
      }
      if (nama != null && profile['nama'] != nama) updates['nama'] = nama;
      if (updates.isNotEmpty) {
        await client.from('users').update(updates).eq('id', profile['id']);
        profile = {...profile, ...updates};
      }
    }
    final avatarPath = profile['avatar_path'] as String?;
    if (avatarPath != null) {
      profile['avatar_url'] = await client.storage
          .from('avatars')
          .createSignedUrl(avatarPath, 300);
    }
    return profile;
  }

  Future<String> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final profile = await getCurrentProfile();
    if (profile == null) {
      throw StateError(
        'Profil belum tersedia. Periksa migration Firebase Auth bridge dan Third-Party Auth Supabase.',
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

    final response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await response.user?.updateDisplayName(nama);
    await getCurrentProfile(nisn: nisn, nama: nama);
    return response.user != null;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<String?> signInWithGoogle() async {
    await _googleSignIn.signOut();
    final account = await _googleSignIn.signIn();
    if (account == null) return null;

    final googleAuthentication = await account.authentication;
    final idToken = googleAuthentication.idToken;
    if (idToken == null) {
      throw StateError('Google tidak mengembalikan ID token.');
    }
    final credential = firebase_auth.GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: googleAuthentication.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    final profile = await getCurrentProfile(nama: account.displayName);
    return profile?['role'] as String? ?? 'siswa';
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future<String> startExamSession() async {
    final profile = await getCurrentProfile();
    if (profile == null) {
      throw StateError('Silakan masuk untuk memulai sesi ujian.');
    }
    final row = await client
        .from('exam_sessions')
        .insert({'user_id': profile['id']})
        .select('id')
        .single();
    return row['id'] as String;
  }

  Future<void> endExamSession({
    required String sessionId,
    required String status,
  }) async {
    final profile = await getCurrentProfile();
    if (profile == null) throw StateError('Sesi akun tidak aktif.');
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
        .eq('user_id', profile['id']);
  }

  Future<void> updatePassword(String password) async {
    if (password.length < 8) {
      throw ArgumentError('Kata sandi minimal 8 karakter.');
    }
    final user = currentUser;
    if (user == null) throw StateError('Sesi Firebase tidak aktif.');
    await user.updatePassword(password);
  }

  Future<List<Map<String, dynamic>>> fetchMaterials() async {
    final rows = await client
        .from('materials')
        .select()
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(rows);
  }

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final profile = await getCurrentProfile();
    if (profile == null) throw StateError('Silakan masuk untuk melihat tugas.');

    final rows = await client
        .from('tasks')
        .select()
        .eq('user_id', profile['id'])
        .order('due_date');
    return List<Map<String, dynamic>>.from(rows);
  }

  Future<void> updateTaskStatus({
    required String taskId,
    required String status,
  }) async {
    final profile = await getCurrentProfile();
    if (profile == null) {
      throw StateError('Silakan masuk untuk memperbarui tugas.');
    }
    if (!{'pending', 'in_progress', 'completed'}.contains(status)) {
      throw ArgumentError.value(status, 'status', 'Status tugas tidak valid.');
    }

    await client
        .from('tasks')
        .update({'status': status})
        .eq('id', taskId)
        .eq('user_id', profile['id']);
  }

  Future<String> uploadAvatar({
    required Uint8List bytes,
    required String extension,
    required String contentType,
  }) async {
    final profile = await getCurrentProfile();
    if (profile == null) {
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

    final firebaseUid = currentUser!.uid;
    final path = '$firebaseUid/avatar.$normalizedExtension';
    await client.storage
        .from('avatars')
        .uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(upsert: true, contentType: contentType),
        );
    await client
        .from('users')
        .update({'avatar_path': path})
        .eq('id', profile['id']);
    return path;
  }

  Future<String> uploadAssignment({
    required String taskId,
    required String fileName,
    required Uint8List bytes,
    required String contentType,
  }) async {
    final profile = await getCurrentProfile();
    if (profile == null) {
      throw StateError('Silakan masuk untuk mengunggah tugas.');
    }
    final safeFileName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
    final firebaseUid = currentUser!.uid;
    final path = '$firebaseUid/$taskId/$safeFileName';
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
        .eq('user_id', profile['id']);
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
        ? 'Firebase Auth + Supabase • ${AppVersion.name}'
        : 'Supabase belum diinisialisasi';
  }
}

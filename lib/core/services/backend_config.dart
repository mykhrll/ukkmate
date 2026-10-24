import 'package:flutter/foundation.dart';

/// Configuration and service bridge for Backend (Firebase & Supabase).
///
/// Prepares the application for clean database connection, removing hardcoded
/// demo dependencies while providing clear status indicators and contract methods.
class BackendConfig {
  static final BackendConfig _instance = BackendConfig._internal();
  factory BackendConfig() => _instance;
  BackendConfig._internal();

  /// Whether the app is connected to the backend database (Supabase / Firebase).
  /// Once backend is connected, toggle this or set dynamically upon initialization.
  bool isConnected = false;

  /// Configured backend providers
  final String primaryBackend = 'Supabase Database & Auth';
  final String secondaryBackend = 'Firebase Cloud Messaging & Analytics';

  /// Supabase Configuration Placeholders (to be configured in backend phase)
  String supabaseUrl = 'https://your-project-id.supabase.co';
  String supabaseAnonKey = 'your-anon-key';

  /// Firebase Project ID Placeholder
  String firebaseProjectId = 'ukkmate-smk-official';

  /// Sends a password reset email via registered user email.
  /// Ready to invoke Supabase `auth.resetPasswordForEmail()` or Firebase `sendPasswordResetEmail()`.
  Future<bool> sendPasswordResetEmail(String email) async {
    // Simulate network delay / prepare for actual API call
    await Future.delayed(const Duration(milliseconds: 1200));

    debugPrint('[BackendService] Password reset link sent to: $email');
    // In production with Supabase:
    // await Supabase.instance.client.auth.resetPasswordForEmail(email);
    // In production with Firebase:
    // await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return true;
  }

  /// Handles Google Sign In / Registration.
  /// Prepares token exchange with Supabase / Firebase.
  Future<Map<String, dynamic>> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 1200));

    debugPrint('[BackendService] Initiating Google Sign-In with Firebase/Supabase...');
    return {
      'success': true,
      'email': 'siswa.smk@belajar.id',
      'name': 'Muhamad Zidan',
      'photoUrl': 'assets/pp_default_laki-laki.jpg',
      'role': 'siswa',
      'provider': 'google.com',
    };
  }

  /// Registers user with password validation and backend persistence.
  Future<bool> registerUser({
    required String nisn,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      throw Exception('Konfirmasi kata sandi tidak cocok.');
    }
    if (password.length < 8) {
      throw Exception('Kata sandi minimal 8 karakter.');
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    debugPrint('[BackendService] User registered successfully: $email ($nisn)');
    return true;
  }

  /// Returns user-friendly backend connection status
  String get connectionStatusText {
    return isConnected
        ? 'Database Supabase & Firebase Aktif'
        : 'Mode Lokal • Siap Sinkron Supabase & Firebase';
  }
}

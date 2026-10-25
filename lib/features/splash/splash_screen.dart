import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:ukkmate/features/auth/login_screen.dart';
import 'package:ukkmate/features/onboarding/onboarding_tutorial_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;
  bool _isVideoInitialized = false;
  Timer? _navigationTimer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    // Timer navigasi diinisialisasi independen sejak awal agar tidak pernah stuck di web maupun mobile
    const splashDuration = kIsWeb
        ? Duration(milliseconds: 2500)
        : Duration(milliseconds: 3800);

    _navigationTimer = Timer(splashDuration, () {
      _navigateNext();
    });

    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset('assets/splash-screen.mp4');
      // Berikan batas waktu inisialisasi agar di web tidak pernah hang jika decoder lokal lambat
      await _controller!.initialize().timeout(const Duration(seconds: 2));
      await _controller!.setLooping(false);

      if (kIsWeb) {
        // Autoplay policy browser mewajibkan volume 0 agar video diizinkan diputar otomatis tanpa interaksi pengguna
        await _controller!.setVolume(0.0);
      } else {
        await _controller!.setVolume(1.0);
      }

      await _controller!.play();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('[SplashScreen] Video failed to load (falling back gracefully): $e');
    }
  }

  Future<void> _navigateNext() async {
    if (_hasNavigated || !mounted) return;
    _hasNavigated = true;

    _navigationTimer?.cancel();
    try {
      _controller?.pause();
    } catch (_) {}

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

    if (!mounted) return;

    final targetScreen = !hasSeenOnboarding
        ? const OnboardingTutorialScreen()
        : const LoginScreen();

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => targetScreen,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    try {
      _controller?.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1523),
      body: Center(
        child: _isVideoInitialized && _controller != null
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : _buildFallbackOrWebView(),
      ),
    );
  }

  Widget _buildFallbackOrWebView() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'assets/logo.jpeg',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.school_rounded,
            size: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



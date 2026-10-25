import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ukkmate/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;
  bool _isVideoInitialized = false;
  Timer? _fallbackTimer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    // Timer fallback cadangan (3.5s) agar aplikasi selalu berpindah meskipun video mengalami kendala platform
    _fallbackTimer = Timer(const Duration(milliseconds: 3500), () {
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

      // Dengarkan progres pemutaran video hingga selesai secara alami
      _controller!.addListener(_handleVideoProgress);

      await _controller!.play();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });

        // Sesuaikan timer fallback dengan durasi video aktual + 300ms toleransi
        _fallbackTimer?.cancel();
        final actualDuration = _controller!.value.duration;
        _fallbackTimer = Timer(actualDuration + const Duration(milliseconds: 300), () {
          _navigateNext();
        });
      }
    } catch (e) {
      debugPrint('[SplashScreen] Video failed to load (falling back gracefully): $e');
    }
  }

  void _handleVideoProgress() {
    if (_controller == null || !_controller!.value.isInitialized) return;

    // Saat pemutaran video selesai (durasi 3 detik habis), langsung beralih ke layar berikutnya
    final position = _controller!.value.position;
    final duration = _controller!.value.duration;
    if (position >= duration && duration > Duration.zero) {
      _navigateNext();
    }
  }

  Future<void> _navigateNext() async {
    if (_hasNavigated || !mounted) return;
    _hasNavigated = true;

    _fallbackTimer?.cancel();
    try {
      _controller?.removeListener(_handleVideoProgress);
      _controller?.pause();
    } catch (_) {}

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    try {
      _controller?.removeListener(_handleVideoProgress);
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



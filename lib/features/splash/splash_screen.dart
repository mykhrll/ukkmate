import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
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
  Timer? _countdownTimer;
  int _secondsRemaining = 4;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset('assets/splash-screen.mp4');
      await _controller!.initialize();
      await _controller!.setLooping(false);
      await _controller!.setVolume(1.0);
      await _controller!.play();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('[SplashScreen] Video failed to load, falling back to static animation: $e');
    }

    // Target splash duration: 3.8 seconds (within user's 3-5 seconds requirement)
    _navigationTimer = Timer(const Duration(milliseconds: 3800), () {
      _navigateNext();
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _secondsRemaining > 1) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _navigateNext() async {
    if (_hasNavigated || !mounted) return;
    _hasNavigated = true;

    _navigationTimer?.cancel();
    _countdownTimer?.cancel();
    _controller?.pause();

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

    if (!mounted) return;

    if (!hasSeenOnboarding) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingTutorialScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    } else {
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
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _countdownTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Video Player or Fallback Logo
          if (_isVideoInitialized && _controller != null)
            Center(
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            )
          else
            _buildFallbackSplash(),

          // Skip Button & Countdown Timer (Top-Right)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: _navigateNext,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Lewati ($_secondsRemaining)',
                          style: AppTextStyles.caption.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Branding Overlay
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'UKKMate • Standar Asesmen Kejuruan SMK',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    letterSpacing: 1.2,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackSplash() {
    return Container(
      color: AppColors.backgroundLight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.backgroundDark,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/logo.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                color: AppColors.primaryBlue,
                backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Memuat UKKMate...',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

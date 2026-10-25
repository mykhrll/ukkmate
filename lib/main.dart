import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ukkmate/features/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukkmate/core/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UKKMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      builder: (context, child) {
        if (kIsWeb) {
          return Container(
            color: const Color(0xFF0F1523),
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: ClipRect(child: child),
            ),
          );
        }
        return child!;
      },
      home: const SplashScreen(),
    );
  }
}

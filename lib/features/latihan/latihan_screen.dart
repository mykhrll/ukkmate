import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Latihan — Coming Soon',
          style: AppTextStyles.headline3,
        ),
      ),
    );
  }
}

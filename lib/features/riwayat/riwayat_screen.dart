import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Riwayat — Coming Soon',
          style: AppTextStyles.headline3,
        ),
      ),
    );
  }
}

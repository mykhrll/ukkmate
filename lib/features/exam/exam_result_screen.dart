import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/custom_card.dart';
import 'package:ukkmate/features/navigation/main_navigation.dart';

class ExamResultScreen extends StatelessWidget {
  final int score;
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalQuestions;

  const ExamResultScreen({
    super.key,
    this.score = 85,
    this.correctAnswers = 34,
    this.incorrectAnswers = 6,
    this.totalQuestions = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Hasil Ujian', style: AppTextStyles.headline3),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildScoreSection(),
            const SizedBox(height: 32),
            _buildStatisticsSection(),
            const SizedBox(height: 32),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreSection() {
    return CustomCard(
      child: Column(
        children: [
          Text(
            'Selamat! Anda Lulus',
            style: AppTextStyles.headline3.copyWith(
              color: AppColors.successGreenText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Uji Kompetensi Keahlian - Rekayasa Perangkat Lunak',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 32),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 16.0,
            animation: true,
            percent: score / 100,
            center: Text(
              "$score",
              style: AppTextStyles.headline1.copyWith(
                color: AppColors.primaryBlue,
                fontSize: 48,
              ),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Nilai Akhir",
                style: AppTextStyles.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.primaryBlue,
            backgroundColor: AppColors.borderLight,
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rincian Pengerjaan', style: AppTextStyles.headline3),
          const SizedBox(height: 16),
          _buildStatRow(
            'Jawaban Benar',
            correctAnswers.toString(),
            AppColors.successGreenText,
            Icons.check_circle_outline,
          ),
          const Divider(height: 24),
          _buildStatRow(
            'Jawaban Salah',
            incorrectAnswers.toString(),
            AppColors.errorRed,
            Icons.cancel_outlined,
          ),
          const Divider(height: 24),
          _buildStatRow(
            'Tidak Dijawab',
            (totalQuestions - correctAnswers - incorrectAnswers).toString(),
            AppColors.textSecondary,
            Icons.remove_circle_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value, Color color, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.bodyText1,
            ),
          ],
        ),
        Text(
          value,
          style: AppTextStyles.bodyText1.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigation(),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Kembali ke Beranda', style: AppTextStyles.buttonText),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryBlue,
              side: const BorderSide(color: AppColors.primaryBlue),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Lihat Pembahasan',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

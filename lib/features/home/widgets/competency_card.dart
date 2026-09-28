import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/custom_card.dart';

class CompetencyCard extends StatelessWidget {
  const CompetencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status Kompetensi Anda',
                style: AppTextStyles.headline3,
              ),
              Text(
                'Lihat Semua',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildCompetencyItem(
            title: 'Pemrograman Web',
            percent: 0.90,
            color: AppColors.primaryBlue,
          ),
          const SizedBox(height: 16),
          _buildCompetencyItem(
            title: 'Basis Data',
            percent: 0.75,
            color: AppColors.primaryGreen,
          ),
          const SizedBox(height: 16),
          _buildCompetencyItem(
            title: 'Desain UI/UX',
            percent: 0.60,
            color: AppColors.warningOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildCompetencyItem({
    required String title,
    required double percent,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${(percent * 100).toInt()}%',
              style: AppTextStyles.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 8.0,
          animation: true,
          percent: percent,
          barRadius: const Radius.circular(4),
          progressColor: color,
          backgroundColor: AppColors.borderLight,
        ),
      ],
    );
  }
}

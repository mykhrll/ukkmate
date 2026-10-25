import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/home/widgets/menu_card.dart';
import 'package:ukkmate/features/home/widgets/stats_card.dart';
import 'package:ukkmate/features/home/widgets/competency_card.dart';
import 'package:ukkmate/features/exam/exam_session_screen.dart';
import 'package:ukkmate/features/tugas/tugas_screen.dart';
import 'package:ukkmate/features/materi/materi_screen.dart';
import 'package:ukkmate/features/bantuan/bantuan_screen.dart';
import 'package:ukkmate/features/latihan/latihan_mandiri_screen.dart';
import 'package:ukkmate/core/utils/date_formatter.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int index)? onNavigateTab;

  const HomeScreen({super.key, this.onNavigateTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildHeroCard(context),
              const SizedBox(height: 32),
              _buildMenuGrid(context),
              const SizedBox(height: 32),
              const StatsCard(),
              const SizedBox(height: 32),
              const CompetencyCard(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, Muhamad Zidan', style: AppTextStyles.headline3),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Siswa SMK',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.warningOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: AppColors.warningOrange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '7,500 pts',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.warningOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderLight),
              ),
              child: const Icon(Icons.notifications_none, size: 20),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'UJI KOMPETENSI ${DateFormatter.currentYear}',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                DateFormatter.getCurrentFullDateWithWib(),
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Siap hadapi Uji Kompetensi Keahlian?',
            style: AppTextStyles.headline3.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExamSessionScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Mulai Simulasi Ujian'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        MenuCard(
          title: 'Latihan\nMandiri',
          icon: Icons.edit_note,
          color: AppColors.warningOrange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LatihanMandiriScreen()),
            );
          },
        ),
        MenuCard(
          title: 'Tugas\n& PR',
          icon: Icons.assignment,
          color: AppColors.primaryBlue,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const TugasScreen()));
          },
        ),
        MenuCard(
          title: 'Materi &\nModul',
          icon: Icons.menu_book,
          color: AppColors.primaryGreen,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const MateriScreen()));
          },
        ),
        MenuCard(
          title: 'Pusat\nBantuan',
          icon: Icons.help_outline,
          color: Colors.purple,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const BantuanScreen()));
          },
        ),
      ],
    );
  }
}

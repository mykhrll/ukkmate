import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class MateriScreen extends StatelessWidget {
  const MateriScreen({super.key});

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
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildProgressCard(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategoryChips(),
              const SizedBox(height: 24),
              _buildListHeader(),
              const SizedBox(height: 16),
              _buildMateriCard(
                'Modul 1: Konsep Dasar Database Relasional',
                'Pemahaman dasar entitas, atribut, relasi (1:1, 1:N, M:N), dan normalisasi tabel.',
                'RPL', 'Basis Data', 
                60, '4 dari 8 Sub-materi selesai', 
                'Lanjutkan', AppColors.primaryBlue,
              ),
              const SizedBox(height: 16),
              _buildMateriCard(
                'Modul 2: Topologi Jaringan & Subnetting',
                'Mempelajari jenis topologi fisik/logik, perhitungan IP Address kelas C, dan CIDR.',
                'TKJ', 'Jaringan', 
                0, 'Belum dimulai', 
                'Mulai Belajar', AppColors.primaryBlue,
                isBaru: true,
              ),
              const SizedBox(height: 16),
              _buildMateriCard(
                'Modul 3: Dasar UI/UX Design (Figma)',
                'Prinsip desain antarmuka, wireframing, dan pembuatan prototipe interaktif menggunakan Figma.',
                'Umum', 'Desain', 
                100, 'Selesai dipelajari', 
                'Lihat Sertifikat', AppColors.backgroundDark,
                isCompleted: true,
              ),
              const SizedBox(height: 24),
              _buildPremiumCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/logo.jpeg',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('UKKMATE CBT', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                Text('Materi', style: AppTextStyles.headline3),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.successGreenBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.circle, color: AppColors.successGreenText, size: 8),
                  const SizedBox(width: 6),
                  Text('Tersinkron', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_graph, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('PROGRES BELAJARMU', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.8), fontWeight: FontWeight.bold, fontSize: 10)),
                      const SizedBox(width: 4),
                      const Icon(Icons.circle, color: AppColors.primaryGreen, size: 6),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text('60% Materi Terselesaikan', style: AppTextStyles.headline3.copyWith(color: Colors.white, fontSize: 18)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.white24,
              color: AppColors.primaryGreen,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('4 dari 12 Modul Bulan Ini', style: AppTextStyles.caption.copyWith(color: Colors.white)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Lanjutkan Belajar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.textSecondary),
          hintText: 'Cari judul materi, topik...',
          hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.tune, color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(
            label: const Text('Semua'),
            backgroundColor: AppColors.primaryBlue,
            labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.transparent)),
          ),
          const SizedBox(width: 8),
          Chip(
            label: const Text('RPL'),
            backgroundColor: Colors.white,
            labelStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: AppColors.borderLight)),
          ),
          const SizedBox(width: 8),
          Chip(
            label: const Text('TKJ'),
            backgroundColor: Colors.white,
            labelStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: AppColors.borderLight)),
          ),
          const SizedBox(width: 8),
          Chip(
            label: const Text('Multimedia'),
            backgroundColor: Colors.white,
            labelStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: AppColors.borderLight)),
          ),
        ],
      ),
    );
  }

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Modul Pembelajaran', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('12 Modul', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.sort, color: AppColors.textSecondary, size: 14),
            const SizedBox(width: 4),
            Text('Terbaru', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
          ],
        ),
      ],
    );
  }

  Widget _buildMateriCard(
    String title, String desc,
    String badge1, String badge2,
    int progressPercent, String progressText,
    String buttonText, Color buttonColor,
    {bool isBaru = false, bool isCompleted = false}
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildSmallBadge(badge1, AppColors.primaryBlue.withValues(alpha: 0.1), AppColors.primaryBlue),
              const SizedBox(width: 8),
              _buildSmallBadge(badge2, AppColors.warningOrange.withValues(alpha: 0.1), AppColors.warningOrange),
              if (isBaru) ...[
                const SizedBox(width: 8),
                _buildSmallBadge('Baru', AppColors.primaryGreen, Colors.white, filled: true),
              ],
              const Spacer(),
              Icon(isCompleted ? Icons.check_circle : Icons.bookmark_border, color: isCompleted ? AppColors.primaryGreen : AppColors.textSecondary, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.headline3.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text(desc, style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, height: 1.4)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(
                        value: progressPercent / 100,
                        backgroundColor: AppColors.borderLight,
                        color: isCompleted ? AppColors.primaryGreen : AppColors.primaryBlue,
                        strokeWidth: 4,
                      ),
                    ),
                    Text('$progressPercent%', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10, color: isCompleted ? AppColors.primaryGreen : AppColors.textPrimary)),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isCompleted ? 'Modul Selesai' : 'Progres Belajar', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Text(progressText, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallBadge(String text, Color bgColor, Color textColor, {bool filled = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: filled ? textColor : bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: AppTextStyles.caption.copyWith(color: filled ? Colors.white : textColor, fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }

  Widget _buildPremiumCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.warningOrange.withValues(alpha: 0.1), AppColors.warningOrange.withValues(alpha: 0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warningOrange.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.warningOrange,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.star, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Akses Modul Premium', style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 4),
                Text('Upgrade untuk mendapatkan video tutorial eksklusif dan bedah soal UKK.', style: AppTextStyles.caption.copyWith(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class BantuanScreen extends StatelessWidget {
  const BantuanScreen({super.key});

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
              const SizedBox(height: 32),
              _buildWelcomeAndSearch(),
              const SizedBox(height: 32),
              Text('FAQ & Kendala Umum', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
              const SizedBox(height: 16),
              _buildFaqList(),
              const SizedBox(height: 32),
              Text('Hubungi Kami', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
              const SizedBox(height: 16),
              _buildContactOptions(),
              const SizedBox(height: 24),
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
                Text('Pusat Bantuan', style: AppTextStyles.headline3),
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
                  Text('Online', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold)),
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

  Widget _buildWelcomeAndSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Halo, ada yang bisa kami bantu?', style: AppTextStyles.headline1.copyWith(fontSize: 24, height: 1.2)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: AppColors.primaryBlue),
              hintText: 'Cari kendala (mis: lupa password)...',
              hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFaqList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          _buildFaqItem('Bagaimana cara mereset password akun CBT?'),
          const Divider(height: 1, color: AppColors.borderLight),
          _buildFaqItem('Kenapa paket soal offline tidak bisa diakses?'),
          const Divider(height: 1, color: AppColors.borderLight),
          _buildFaqItem('Cara melihat rincian hasil penilaian uji kompetensi'),
          const Divider(height: 1, color: AppColors.borderLight),
          _buildFaqItem('Kendala koneksi putus saat sedang ujian berlangsung'),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(text, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildContactOptions() {
    return Column(
      children: [
        _buildContactCard(
          icon: Icons.chat_bubble_outline,
          title: 'Live Chat Admin',
          desc: 'Tersedia 08.00 - 16.00 WIB',
          color: AppColors.primaryBlue,
        ),
        const SizedBox(height: 16),
        _buildContactCard(
          icon: Icons.email_outlined,
          title: 'Email Dukungan',
          desc: 'Balasan maks. 1x24 jam kerja',
          color: AppColors.primaryGreen,
        ),
      ],
    );
  }

  Widget _buildContactCard({required IconData icon, required String title, required String desc, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.headline3.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(desc, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary.withValues(alpha: 0.5), size: 16),
        ],
      ),
    );
  }
}

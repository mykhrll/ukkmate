import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/custom_card.dart';
import 'package:ukkmate/core/widgets/status_badge.dart';
import 'package:ukkmate/features/auth/login_screen.dart';
import 'package:ukkmate/features/profile/widgets/settings_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profil Siswa',
          style: AppTextStyles.headline3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildInfoCard(),
            const SizedBox(height: 24),
            _buildSettingsCard(),
            const SizedBox(height: 24),
            _buildLogoutButton(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/logo.jpeg'),
        ),
        const SizedBox(height: 16),
        Text(
          'Muhamad Zidan',
          style: AppTextStyles.headline2,
        ),
        const SizedBox(height: 8),
        Text(
          'NISN: 0068492019',
          style: AppTextStyles.bodyText1.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        const StatusBadge(
          text: 'Siswa Aktif',
          type: BadgeType.success,
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Akademik',
            style: AppTextStyles.headline3,
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Asal Sekolah', 'SMKN 1 Contoh'),
          const Divider(height: 24),
          _buildInfoRow('Kompetensi Keahlian', 'Rekayasa Perangkat Lunak'),
          const Divider(height: 24),
          _buildInfoRow('Tahun Ajaran', '2023/2024'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyText2.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyText2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsCard() {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengaturan & Bantuan',
            style: AppTextStyles.headline3,
          ),
          const SizedBox(height: 16),
          SettingsItem(
            icon: Icons.edit_outlined,
            title: 'Edit Profil',
            subtitle: 'Perbarui data diri dan foto profil',
            onTap: () {},
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.lock_outline,
            title: 'Keamanan Akun',
            subtitle: 'Ubah kata sandi',
            onTap: () {},
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.help_outline,
            title: 'Pusat Bantuan',
            subtitle: 'FAQ dan hubungi dukungan',
            onTap: () {},
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Versi 1.0.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(8),
      child: SettingsItem(
        icon: Icons.logout,
        title: 'Keluar Akun',
        isDestructive: true,
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/custom_card.dart';
import 'package:ukkmate/core/widgets/status_badge.dart';
import 'package:ukkmate/features/auth/login_screen.dart';
import 'package:ukkmate/features/profile/widgets/settings_item.dart';
import 'package:ukkmate/features/profile/profil_siswa_screen.dart';
import 'package:ukkmate/features/sinkronisasi/status_sinkronisasi_screen.dart';
import 'package:ukkmate/features/guru/guru_dashboard_screen.dart';
import 'package:ukkmate/features/bantuan/bantuan_screen.dart';

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
            _buildSettingsCard(context),
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
          backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
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

  Widget _buildSettingsCard(BuildContext context) {
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
            title: 'Edit Profil & Validasi NISN',
            subtitle: 'Data akademik, identitas, dan validasi',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilSiswaScreen()));
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.sync,
            title: 'Status Sinkronisasi',
            subtitle: 'Data offline & antrean sinkronisasi',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const StatusSinkronisasiScreen()));
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.dashboard_customize_outlined,
            title: 'Portal Guru Pendamping',
            subtitle: 'Dashboard pantauan siswa & rekap CBT',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const GuruDashboardScreen()));
            },
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BantuanScreen()));
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Versi 0.0.5',
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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ukkmate/core/constants/app_version.dart';
import 'package:ukkmate/core/services/backend_config.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/custom_card.dart';
import 'package:ukkmate/core/widgets/status_badge.dart';
import 'package:ukkmate/features/auth/login_screen.dart';
import 'package:ukkmate/features/profile/widgets/settings_item.dart';
import 'package:ukkmate/features/profile/profil_siswa_screen.dart';
import 'package:ukkmate/features/sinkronisasi/status_sinkronisasi_screen.dart';

import 'package:ukkmate/features/bantuan/bantuan_screen.dart';
import 'package:ukkmate/core/utils/date_formatter.dart';
import 'package:ukkmate/features/navigation/main_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>?> _profileFuture;
  bool _isUploadingAvatar = false;

  @override
  void initState() {
    super.initState();
    _profileFuture = BackendConfig().getCurrentProfile();
  }

  Future<void> _pickAvatar() async {
    final file = await FilePicker.pickFile(type: FileType.image);
    if (file == null) return;
    setState(() => _isUploadingAvatar = true);
    try {
      final extension = (file.extension ?? 'jpg').toLowerCase();
      await BackendConfig().uploadAvatar(
        bytes: await file.readAsBytes(),
        extension: extension,
        contentType: extension == 'png'
            ? 'image/png'
            : extension == 'webp'
            ? 'image/webp'
            : 'image/jpeg',
      );
      setState(() => _profileFuture = BackendConfig().getCurrentProfile());
      _showMessage('Foto profil berhasil diperbarui.', isError: false);
    } catch (error) {
      _showMessage('Gagal mengunggah foto profil: $error', isError: true);
    } finally {
      if (mounted) setState(() => _isUploadingAvatar = false);
    }
  }

  void _showMessage(String message, {required bool isError}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.errorRed : AppColors.primaryGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profil Siswa', style: AppTextStyles.headline3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: _profileFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Profil gagal dimuat: ${snapshot.error}');
                }
                final profile = snapshot.data;
                return Column(
                  children: [
                    _buildProfileHeader(profile),
                    const SizedBox(height: 24),
                    _buildInfoCard(profile),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
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

  Widget _buildProfileHeader(Map<String, dynamic>? profile) {
    final avatarUrl = profile?['avatar_url'] as String?;
    final ImageProvider<Object> avatar = avatarUrl == null
        ? const AssetImage('assets/pp_default_laki-laki.jpg')
        : NetworkImage(avatarUrl);
    return Column(
      children: [
        CircleAvatar(radius: 50, backgroundImage: avatar),
        TextButton.icon(
          onPressed: _isUploadingAvatar ? null : _pickAvatar,
          icon: _isUploadingAvatar
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.upload_outlined),
          label: const Text('Ubah foto profil'),
        ),
        const SizedBox(height: 16),
        Text(
          profile?['nama'] as String? ?? 'Nama belum diatur',
          style: AppTextStyles.headline2,
        ),
        const SizedBox(height: 8),
        Text(
          'NISN: ${profile?['nisn'] ?? '-'}',
          style: AppTextStyles.bodyText1.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        const StatusBadge(text: 'Siswa Aktif', type: BadgeType.success),
      ],
    );
  }

  Widget _buildInfoCard(Map<String, dynamic>? profile) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informasi Akademik', style: AppTextStyles.headline3),
          const SizedBox(height: 16),
          _buildInfoRow('Email', profile?['email'] as String? ?? '-'),
          const Divider(height: 24),
          _buildInfoRow('Role', profile?['role'] as String? ?? '-'),
          const Divider(height: 24),
          _buildInfoRow('Tahun Ajaran', DateFormatter.currentAcademicYear),
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
          style: AppTextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSettingsCard(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pengaturan & Bantuan', style: AppTextStyles.headline3),
          const SizedBox(height: 16),
          SettingsItem(
            icon: Icons.menu_book_outlined,
            title: 'Panduan & Petunjuk Menu',
            subtitle: 'Buka kembali tur interaktif menu aplikasi',
            onTap: () {
              MainNavigation.startTour(context);
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.edit_outlined,
            title: 'Edit Profil & Validasi NISN',
            subtitle: 'Data akademik, identitas, dan validasi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilSiswaScreen()),
              );
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.sync,
            title: 'Status Sinkronisasi',
            subtitle: 'Data offline & antrean sinkronisasi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const StatusSinkronisasiScreen(),
                ),
              );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BantuanScreen()),
              );
            },
          ),
          const Divider(height: 16),
          SettingsItem(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Versi ${AppVersion.name}',
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
        onTap: () async {
          try {
            await BackendConfig().signOut();
          } catch (error) {
            _showMessage('Gagal keluar: $error', isError: true);
            return;
          }
          if (!context.mounted) return;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        },
      ),
    );
  }
}

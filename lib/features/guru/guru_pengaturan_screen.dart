import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/utils/date_formatter.dart';
import 'package:ukkmate/core/services/backend_config.dart';
import 'package:ukkmate/features/auth/login_screen.dart';
import 'package:ukkmate/features/onboarding/onboarding_tutorial_screen.dart';
import 'package:ukkmate/features/chatbot/chatbot_screen.dart';

class GuruPengaturanScreen extends StatefulWidget {
  final bool embedded;

  const GuruPengaturanScreen({super.key, this.embedded = false});

  @override
  State<GuruPengaturanScreen> createState() => _GuruPengaturanScreenState();
}

class _GuruPengaturanScreenState extends State<GuruPengaturanScreen> {
  bool _offlineCaching = true;
  bool _randomizeQuestions = true;
  bool _randomizeAnswers = true;
  bool _antiCheatDetection = true;
  bool _isSyncing = false;
  String _lastSyncTime = DateFormatter.getCurrentTimeWib();

  Future<void> _syncDatabase() async {
    setState(() {
      _isSyncing = true;
    });

    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;

    setState(() {
      _isSyncing = false;
      _lastSyncTime = DateFormatter.getCurrentTimeWib();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Database Supabase & Firebase berhasil disinkronkan ($_lastSyncTime)!',
        ),
        backgroundColor: AppColors.primaryGreen,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              const Icon(Icons.logout, color: AppColors.errorRed),
              const SizedBox(width: 8),
              Text('Keluar Akun Guru', style: AppTextStyles.headline3),
            ],
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari portal Guru Pendamping UKKMate?',
            style: AppTextStyles.bodyText1,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Batal',
                style: AppTextStyles.buttonText.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.errorRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Keluar', style: AppTextStyles.buttonText),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Pengaturan Guru',
          style: AppTextStyles.headline3.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: !widget.embedded,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            const SizedBox(height: 20),
            _buildBackendSyncCard(),
            const SizedBox(height: 20),
            _buildSectionHeader('PENGATURAN ASESMEN & CBT'),
            _buildExamSettingsCard(),
            const SizedBox(height: 20),
            _buildSectionHeader('PANDUAN & BANTUAN'),
            _buildSupportCard(),
            const SizedBox(height: 20),
            _buildSectionHeader('KEAMANAN AKUN'),
            _buildSecurityCard(),
            const SizedBox(height: 28),
            _buildLogoutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryBlue, width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/pp_default_laki-laki.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Drs. Bambang Sudarsono, M.Kom',
                        style: AppTextStyles.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: AppColors.primaryGreen,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'NIP: 19780512 200501 1 003',
                  style: AppTextStyles.caption.copyWith(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Guru Pendamping • Asesor LSP-P1',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackendSyncCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.cloud_sync_outlined,
                      color: AppColors.primaryBlue,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Database Backend',
                        style: AppTextStyles.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        BackendConfig().connectionStatusText,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.successGreenBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Siap Sinkron',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.successGreenText,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Terakhir sinkron: $_lastSyncTime',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              InkWell(
                onTap: _isSyncing ? null : _syncDatabase,
                child: Row(
                  children: [
                    if (_isSyncing)
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primaryBlue,
                        ),
                      )
                    else
                      const Icon(
                        Icons.refresh,
                        size: 16,
                        color: AppColors.primaryBlue,
                      ),
                    const SizedBox(width: 4),
                    Text(
                      _isSyncing ? 'Menyinkronkan...' : 'Sinkronkan',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text('Cache Offline Cepat', style: AppTextStyles.bodyText2),
            subtitle: Text(
              'Simpan lembar soal & nilai di perangkat saat jaringan lambat',
              style: AppTextStyles.caption,
            ),
            value: _offlineCaching,
            activeThumbColor: AppColors.primaryBlue,
            onChanged: (val) => setState(() => _offlineCaching = val),
          ),
        ],
      ),
    );
  }

  Widget _buildExamSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          SwitchListTile(
            title: Text('Acak Urutan Butir Soal', style: AppTextStyles.bodyText1),
            subtitle: Text(
              'Mencegah kecurangan antar siswa yang duduk berdekatan',
              style: AppTextStyles.caption,
            ),
            value: _randomizeQuestions,
            activeThumbColor: AppColors.primaryBlue,
            onChanged: (val) => setState(() => _randomizeQuestions = val),
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: Text('Acak Opsi Pilihan Jawaban (A-E)', style: AppTextStyles.bodyText1),
            subtitle: Text(
              'Opsi jawaban diacak secara matematis untuk tiap peserta',
              style: AppTextStyles.caption,
            ),
            value: _randomizeAnswers,
            activeThumbColor: AppColors.primaryBlue,
            onChanged: (val) => setState(() => _randomizeAnswers = val),
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: Text('Deteksi Keluar Layar (Anti-Cheat)', style: AppTextStyles.bodyText1),
            subtitle: Text(
              'Beri peringatan atau kunci lembar ujian jika siswa membuka aplikasi lain',
              style: AppTextStyles.caption,
            ),
            value: _antiCheatDetection,
            activeThumbColor: AppColors.primaryBlue,
            onChanged: (val) => setState(() => _antiCheatDetection = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.menu_book_outlined, color: AppColors.primaryBlue),
            title: Text('Panduan & Petunjuk Aplikasi', style: AppTextStyles.bodyText1),
            subtitle: Text('Pelajari alur ujian, import soal, dan penilaian UKK', style: AppTextStyles.caption),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OnboardingTutorialScreen(isFromSettings: true),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.smart_toy_outlined, color: AppColors.primaryBlue),
            title: Text('Tanya UKKMate AI Assistant', style: AppTextStyles.bodyText1),
            subtitle: Text('Asisten cerdas untuk bank soal dan modul UKK', style: AppTextStyles.caption),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatBotScreen()),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.textSecondary),
            title: Text('Tentang UKKMate Guru', style: AppTextStyles.bodyText1),
            subtitle: Text('Versi 0.2.1 • Standar BNSP & Dapodik', style: AppTextStyles.caption),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_outline, color: AppColors.textPrimary),
            title: Text('Ubah Kata Sandi NIP', style: AppTextStyles.bodyText1),
            subtitle: Text('Perbarui keamanan akses portal guru Anda', style: AppTextStyles.caption),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tautan ubah kata sandi telah dikirim ke email terdaftar Dapodik Anda'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _showLogoutDialog,
        icon: const Icon(Icons.logout, color: AppColors.errorRed, size: 18),
        label: Text(
          'Keluar dari Akun Guru Pendamping',
          style: AppTextStyles.buttonText.copyWith(
            color: AppColors.errorRed,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.errorRed),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

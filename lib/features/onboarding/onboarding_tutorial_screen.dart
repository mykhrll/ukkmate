import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/auth/login_screen.dart';

/// Screen displaying a tutorial and walkthrough for first-time users.
class OnboardingTutorialScreen extends StatefulWidget {
  final bool isFromSettings;

  const OnboardingTutorialScreen({super.key, this.isFromSettings = false});

  @override
  State<OnboardingTutorialScreen> createState() => _OnboardingTutorialScreenState();
}

class _OnboardingTutorialScreenState extends State<OnboardingTutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_TutorialItem> _tutorials = [
    const _TutorialItem(
      title: 'Selamat Datang di UKKMate',
      subtitle: 'Aplikasi Terpadu Persiapan Uji Kompetensi Keahlian SMK',
      description:
          'UKKMate membantu siswa SMK mempersiapkan asesmen sertifikasi kejuruan BNSP / LSP-P1 dengan standar kompetensi nasional.',
      icon: Icons.school_outlined,
      badgeText: 'PANDUAN LANGKAH 1 DARI 4',
      badgeColor: AppColors.primaryBlue,
      features: [
        'Akses kisi-kisi dan materi uji kompetensi',
        'Validasi otomatis NISN siswa dengan Dapodik',
        'Simulasi latihan mandiri kapan pun di mana pun',
      ],
    ),
    const _TutorialItem(
      title: 'Simulasi CBT & Ujian Digital',
      subtitle: 'Rasakan Pengalaman Ujian Teori yang Sebenarnya',
      description:
          'Uji kemampuan Anda melalui modul Computer-Based Test (CBT) dengan countdown timer, penomoran soal interaktif, dan kunci anti-curang.',
      icon: Icons.computer_outlined,
      badgeText: 'PANDUAN LANGKAH 2 DARI 4',
      badgeColor: AppColors.primaryGreen,
      features: [
        'Timer ujian sesuai durasi resmi UKK',
        'Daftar ragu-ragu dan navigasi cepat butir soal',
        'Kalkulasi skor otomatis dan pembahasan detail',
      ],
    ),
    const _TutorialItem(
      title: 'Asisten AI UKKMate & Bank Soal',
      subtitle: 'Konsultasi Belajar & Pemecahan Soal 24/7',
      description:
          'Gunakan ikon robot pintar di pojok kanan bawah untuk bertanya seputar studi kasus UKK, sintaks pemrograman, dan tips lulus.',
      icon: Icons.smart_toy_outlined,
      badgeText: 'PANDUAN LANGKAH 3 DARI 4',
      badgeColor: AppColors.warningOrange,
      features: [
        'Konsultasi materi RPL, TKJ, dan kejuruan lainnya',
        'Penjelasan langkah per langkah pemecahan error',
        'Akses bank soal terbaru dari guru pembimbing',
      ],
    ),
    const _TutorialItem(
      title: 'Portal Guru & Pemantauan Nilai',
      subtitle: 'Satu Sistem untuk Siswa dan Guru Pendamping',
      description:
          'Bagi guru pendamping, kelola daftar asesi, pantau perolehan nilai siswa secara real-time, dan atur paket bank soal dengan mudah.',
      icon: Icons.assignment_ind_outlined,
      badgeText: 'PANDUAN LANGKAH 4 DARI 4',
      badgeColor: AppColors.primaryBlue,
      features: [
        'Menu Kelas tampil langsung saat login guru',
        'Pemantauan status pengerjaan siswa',
        'Sinkronisasi nilai ke Dapodik & database',
      ],
    ),
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);

    if (!mounted) return;

    if (widget.isFromSettings) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  void _nextPage() {
    if (_currentPage < _tutorials.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: widget.isFromSettings,
        actions: [
          TextButton(
            onPressed: _completeOnboarding,
            child: Text(
              widget.isFromSettings ? 'Tutup' : 'Lewati',
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _tutorials.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _tutorials[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Animated Hero Icon Card
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: item.badgeColor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: item.badgeColor.withValues(alpha: 0.25),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: item.badgeColor.withValues(alpha: 0.15),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            item.icon,
                            size: 54,
                            color: item.badgeColor,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Step Pill
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: item.badgeColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            item.badgeText,
                            style: AppTextStyles.caption.copyWith(
                              color: item.badgeColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Title & Subtitle
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headline2.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.subtitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subtitle2.copyWith(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyText1.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Feature Highlights
                        Container(
                          padding: const EdgeInsets.all(16),
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
                            children: item.features.map((feat) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: item.badgeColor.withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 14,
                                        color: item.badgeColor,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        feat,
                                        style: AppTextStyles.bodyText2.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation Dots & Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _tutorials.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 28 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primaryBlue
                              : AppColors.borderLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == _tutorials.length - 1
                                ? (widget.isFromSettings
                                    ? 'Selesai Membaca'
                                    : 'Mulai Masuk Aplikasi')
                                : 'Lanjutkan Petunjuk',
                            style: AppTextStyles.buttonText.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _currentPage == _tutorials.length - 1
                                ? Icons.check_circle_outline
                                : Icons.arrow_forward,
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TutorialItem {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final String badgeText;
  final Color badgeColor;
  final List<String> features;

  const _TutorialItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.badgeText,
    required this.badgeColor,
    required this.features,
  });
}

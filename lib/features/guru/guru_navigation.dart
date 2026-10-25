import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/floating_chat_button.dart';
import 'package:ukkmate/features/guru/guru_daftar_asesi_screen.dart';
import 'package:ukkmate/features/guru/guru_bank_soal_screen.dart';
import 'package:ukkmate/features/guru/guru_dashboard_screen.dart';
import 'package:ukkmate/features/guru/guru_pengaturan_screen.dart';
import 'package:ukkmate/features/onboarding/interactive_menu_tour.dart';

/// Unified navigation wrapper for the Guru (Teacher) portal.
/// Defaults to Kelas tab (initialIndex = 0) upon opening.
class GuruNavigation extends StatefulWidget {
  final int initialIndex;
  const GuruNavigation({super.key, this.initialIndex = 0});

  static void startTour(BuildContext context) {
    final state = context.findAncestorStateOfType<_GuruNavigationState>();
    if (state != null) {
      state.startTour();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const GuruNavigation()),
      );
    }
  }

  @override
  State<GuruNavigation> createState() => _GuruNavigationState();
}

class _GuruNavigationState extends State<GuruNavigation> {
  late int _currentIndex;
  bool _isTourActive = false;
  int _currentTourStep = 0;

  static const List<TourStep> _teacherTourSteps = [
    TourStep(
      title: 'Menu Kelas Binaan',
      badgeText: 'PANDUAN GURU • 1 DARI 5',
      description: 'Daftar siswa asesi dan rombel binaan Anda untuk verifikasi kesiapan uji kompetensi kejuruan.',
      icon: Icons.class_,
      color: AppColors.primaryBlue,
      tabIndex: 0,
    ),
    TourStep(
      title: 'Manajemen Bank Soal',
      badgeText: 'PANDUAN GURU • 2 DARI 5',
      description: 'Kelola paket butir soal kejuruan SMK, kisi-kisi BNSP, dan jadwalkan distribusi simulasi CBT.',
      icon: Icons.storage,
      color: AppColors.primaryGreen,
      tabIndex: 1,
    ),
    TourStep(
      title: 'Pantauan Real-Time',
      badgeText: 'PANDUAN GURU • 3 DARI 5',
      description: 'Monitor siswa yang sedang mengerjakan ujian serta rekapitulasi nilai kelas secara langsung.',
      icon: Icons.monitor,
      color: AppColors.warningOrange,
      tabIndex: 2,
    ),
    TourStep(
      title: 'Pengaturan & Lab',
      badgeText: 'PANDUAN GURU • 4 DARI 5',
      description: 'Atur integrasi database Supabase, konfigurasi proteksi anti-kecurangan CBT, dan acak urutan soal.',
      icon: Icons.settings,
      color: Colors.purple,
      tabIndex: 3,
    ),
    TourStep(
      title: 'AI Assistant Pengajar',
      badgeText: 'PANDUAN GURU • 5 DARI 5',
      description: 'Konsultasi kurikulum teknis dan perumusan butir soal asesmen secara praktis bersama AI UKKMate.',
      icon: Icons.smart_toy_outlined,
      color: AppColors.primaryBlue,
      isFab: true,
    ),
  ];

  late final List<Widget> _screens = const [
    GuruDaftarAsesiScreen(embedded: true),
    GuruBankSoalScreen(embedded: true),
    GuruDashboardScreen(embedded: true),
    GuruPengaturanScreen(embedded: true),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _checkFirstTimeTour();
  }

  Future<void> _checkFirstTimeTour() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenTour = prefs.getBool('has_seen_guru_tour') ?? false;
    if (!hasSeenTour && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          startTour();
        }
      });
    }
  }

  void startTour() {
    setState(() {
      _isTourActive = true;
      _currentTourStep = 0;
      _currentIndex = _teacherTourSteps[0].tabIndex ?? 0;
    });
  }

  void _nextTourStep() {
    if (_currentTourStep < _teacherTourSteps.length - 1) {
      setState(() {
        _currentTourStep++;
        final targetTab = _teacherTourSteps[_currentTourStep].tabIndex;
        if (targetTab != null) {
          _currentIndex = targetTab;
        }
      });
    } else {
      _finishTour();
    }
  }

  void _prevTourStep() {
    if (_currentTourStep > 0) {
      setState(() {
        _currentTourStep--;
        final targetTab = _teacherTourSteps[_currentTourStep].tabIndex;
        if (targetTab != null) {
          _currentIndex = targetTab;
        }
      });
    }
  }

  Future<void> _finishTour() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_guru_tour', true);
    if (mounted) {
      setState(() {
        _isTourActive = false;
        _currentTourStep = 0;
        _currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: KeyedSubtree(
              key: ValueKey<int>(_currentIndex),
              child: _screens[_currentIndex],
            ),
          ),
          floatingActionButton: const FloatingChatButton(),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: AppColors.borderLight, width: 1),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                if (_isTourActive) return;
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              selectedItemColor: AppColors.primaryBlue,
              unselectedItemColor: AppColors.textSecondary,
              selectedLabelStyle: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              unselectedLabelStyle: AppTextStyles.caption.copyWith(fontSize: 10),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.class_outlined),
                  activeIcon: Icon(Icons.class_),
                  label: 'Kelas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.storage_outlined),
                  activeIcon: Icon(Icons.storage),
                  label: 'Bank Soal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.monitor_outlined),
                  activeIcon: Icon(Icons.monitor),
                  label: 'Pantauan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: 'Pengaturan',
                ),
              ],
            ),
          ),
        ),
        if (_isTourActive)
          InteractiveTourOverlay(
            steps: _teacherTourSteps,
            currentStep: _currentTourStep,
            totalTabs: 4,
            onNext: _nextTourStep,
            onPrevious: _prevTourStep,
            onSkip: _finishTour,
            onFinish: _finishTour,
          ),
      ],
    );
  }
}

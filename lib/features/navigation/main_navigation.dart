import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/floating_chat_button.dart';
import 'package:ukkmate/features/home/home_screen.dart';
import 'package:ukkmate/features/latihan/latihan_screen.dart';
import 'package:ukkmate/features/riwayat/riwayat_screen.dart';
import 'package:ukkmate/features/profile/profile_screen.dart';
import 'package:ukkmate/features/onboarding/interactive_menu_tour.dart';

class MainNavigation extends StatefulWidget {
  final int initialIndex;
  const MainNavigation({super.key, this.initialIndex = 0});

  static void switchTab(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<_MainNavigationState>();
    if (state != null) {
      state.switchTab(index);
    }
  }

  static void startTour(BuildContext context) {
    final state = context.findAncestorStateOfType<_MainNavigationState>();
    if (state != null) {
      state.startTour();
    }
  }

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  bool _isTourActive = false;
  int _currentTourStep = 0;

  static const List<TourStep> _studentTourSteps = [
    TourStep(
      title: 'Menu Beranda',
      badgeText: 'PANDUAN DASAR • 1 DARI 5',
      description: 'Pusat informasi utama: pantau jadwal agenda UKK, materi belajar, dan mulai simulasi CBT kamu.',
      icon: Icons.home,
      color: AppColors.primaryBlue,
      tabIndex: 0,
    ),
    TourStep(
      title: 'Menu Latihan',
      badgeText: 'PANDUAN DASAR • 2 DARI 5',
      description: 'Asah kesiapan dengan kumpulan bank soal kejuruan SMK yang dilengkapi pembahasan dan kunci jawaban instan.',
      icon: Icons.menu_book,
      color: AppColors.warningOrange,
      tabIndex: 1,
    ),
    TourStep(
      title: 'Menu Riwayat',
      badgeText: 'PANDUAN DASAR • 3 DARI 5',
      description: 'Pantau grafik skor ujian, rekap hasil latihan, dan cek evaluasi pencapaian kompetensi kejuruanmu.',
      icon: Icons.history,
      color: AppColors.primaryGreen,
      tabIndex: 2,
    ),
    TourStep(
      title: 'Menu Profil',
      badgeText: 'PANDUAN DASAR • 4 DARI 5',
      description: 'Kelola data diri NISN siswa, status sinkronisasi cloud, serta buka kembali panduan ini kapan pun dibutuhkan.',
      icon: Icons.person,
      color: Colors.purple,
      tabIndex: 3,
    ),
    TourStep(
      title: 'AI Assistant UKKMate',
      badgeText: 'PANDUAN DASAR • 5 DARI 5',
      description: 'Tombol melayang ini bisa kamu ketuk kapan saja untuk bertanya materi UKK atau solusi soal yang sulit.',
      icon: Icons.smart_toy_outlined,
      color: AppColors.primaryBlue,
      isFab: true,
    ),
  ];

  late final List<Widget> _screens = [
    HomeScreen(
      onNavigateTab: switchTab,
    ),
    const LatihanScreen(),
    const RiwayatScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _checkFirstTimeTour();
  }

  Future<void> _checkFirstTimeTour() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenTour = prefs.getBool('has_seen_menu_tour') ?? false;
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
      _currentIndex = _studentTourSteps[0].tabIndex ?? 0;
    });
  }

  void _nextTourStep() {
    if (_currentTourStep < _studentTourSteps.length - 1) {
      setState(() {
        _currentTourStep++;
        final targetTab = _studentTourSteps[_currentTourStep].tabIndex;
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
        final targetTab = _studentTourSteps[_currentTourStep].tabIndex;
        if (targetTab != null) {
          _currentIndex = targetTab;
        }
      });
    }
  }

  Future<void> _finishTour() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_menu_tour', true);
    if (mounted) {
      setState(() {
        _isTourActive = false;
        _currentTourStep = 0;
        _currentIndex = 0;
      });
    }
  }

  void switchTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _screens[_currentIndex],
          floatingActionButton: const FloatingChatButton(),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.borderLight,
                  width: 1,
                ),
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
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: AppTextStyles.caption,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  activeIcon: Icon(Icons.menu_book),
                  label: 'Latihan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history_outlined),
                  activeIcon: Icon(Icons.history),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
        if (_isTourActive)
          InteractiveTourOverlay(
            steps: _studentTourSteps,
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



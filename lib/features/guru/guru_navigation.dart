import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/core/widgets/floating_chat_button.dart';
import 'package:ukkmate/features/guru/guru_daftar_asesi_screen.dart';
import 'package:ukkmate/features/guru/guru_bank_soal_screen.dart';
import 'package:ukkmate/features/guru/guru_dashboard_screen.dart';

/// Unified navigation wrapper for the Guru (Teacher) portal.
/// Uses the same pattern as [MainNavigation] for smooth tab switching
/// instead of pushReplacement which causes page-jump effects.
class GuruNavigation extends StatefulWidget {
  final int initialIndex;
  const GuruNavigation({super.key, this.initialIndex = 0});

  @override
  State<GuruNavigation> createState() => _GuruNavigationState();
}

class _GuruNavigationState extends State<GuruNavigation> {
  late int _currentIndex;

  late final List<Widget> _screens = const [
    GuruDaftarAsesiScreen(embedded: true),
    GuruBankSoalScreen(embedded: true),
    GuruDashboardScreen(embedded: true),
    _GuruPengaturanPlaceholder(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

/// Placeholder screen for Guru Pengaturan (Settings) tab.
class _GuruPengaturanPlaceholder extends StatelessWidget {
  const _GuruPengaturanPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings_outlined,
                size: 64,
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Pengaturan Guru',
                style: AppTextStyles.headline3.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Fitur pengaturan akan segera hadir',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

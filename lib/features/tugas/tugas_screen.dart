import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class TugasScreen extends StatelessWidget {
  const TugasScreen({super.key});

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
              _buildHeader(),
              const SizedBox(height: 24),
              _buildActiveTaskCard(),
              const SizedBox(height: 24),
              _buildFilterTabs(),
              const SizedBox(height: 24),
              _buildListHeader(),
              const SizedBox(height: 16),
              _buildTaskCard(
                'Tugas 1: ERD & Skema Database',
                'Pak Budi Santoso, S.T.',
                'Buat rancangan Entity Relationship Diagram (ERD) untuk sistem Point of Sale, minimal 5 entitas dengan relasi One-to-Many.',
                'RPL', 'Perancangan', 'Tenggat: Besok, 23:59', AppColors.errorRed,
                '60%', 'Dikerjakan', 'Sisa Waktu: 1 Hari 14 Jam',
                'Lanjutkan Mengerjakan', AppColors.primaryBlue,
              ),
              const SizedBox(height: 16),
              _buildTaskCard(
                'Tugas 2: Topologi Jaringan MikroTik',
                'Bu Ani Setiawati, M.Kom.',
                'Konfigurasi VLAN trunking pada MikroTik dan Cisco switch menggunakan GNS3/Cisco Packet Tracer.',
                'TKJ', 'Jaringan', 'Tenggat: 15 Nov, 23:59', AppColors.warningOrange,
                '0%', 'Belum dimulai', 'Sisa Waktu: 5 Hari',
                'Mulai Kerjakan', AppColors.primaryBlue,
              ),
              const SizedBox(height: 16),
              _buildTaskCard(
                'Tugas 3: Laporan PKL Bab 1-3',
                'Tim PKL SMK',
                'Revisi laporan sesuai dengan pedoman terbaru dari sekolah. Perhatikan tata tulis dan sitasi.',
                'Umum', 'Dokumentasi', 'Selesai Dinilai', AppColors.primaryGreen,
                '88', 'Sangat Baik', 'Feedback: "Analisis sistem sudah baik, perbaiki typo di Bab 2."',
                'Lihat Feedback', AppColors.backgroundDark,
                isCompleted: true,
              ),
              const SizedBox(height: 24),
              _buildNotificationTips(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.backgroundDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.assignment, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('UKKMATE CBT', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                Text('Tugas / PR', style: AppTextStyles.headline3),
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
                  Text('Terhubung', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold)),
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

  Widget _buildActiveTaskCard() {
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
                child: const Icon(Icons.notification_important, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('TUGAS AKTIF', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.8), fontWeight: FontWeight.bold, fontSize: 10)),
                      const SizedBox(width: 4),
                      const Icon(Icons.circle, color: AppColors.errorRed, size: 6),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text('3 PR Belum Selesai', style: AppTextStyles.headline3.copyWith(color: Colors.white, fontSize: 18)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text('Tenggat terdekat: Besok, 23:59 WIB', style: AppTextStyles.caption.copyWith(color: Colors.white)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Lihat Kalender', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterTab('Semua', true),
          const SizedBox(width: 8),
          _buildFilterTab('Dalam Proses', false),
          const SizedBox(width: 8),
          _buildFilterTab('Selesai', false),
          const SizedBox(width: 8),
          _buildFilterTab('Terlewat', false),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.primaryBlue : AppColors.borderLight),
      ),
      child: Text(
        title,
        style: AppTextStyles.caption.copyWith(
          color: isSelected ? Colors.white : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Daftar Tugas & PR', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.errorRed.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('3 Aktif', style: AppTextStyles.caption.copyWith(color: AppColors.errorRed, fontWeight: FontWeight.bold, fontSize: 10)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.sort, color: AppColors.textSecondary, size: 14),
            const SizedBox(width: 4),
            Text('Tenggat Waktu', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskCard(
    String title, String teacher, String desc,
    String badge1, String badge2, String deadlineBadge, Color deadlineColor,
    String progressVal, String progressText, String sisaText,
    String buttonText, Color buttonColor, {bool isCompleted = false}
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
              const Spacer(),
              _buildSmallBadge(deadlineBadge, deadlineColor.withValues(alpha: 0.1), deadlineColor, icon: isCompleted ? Icons.check_circle : Icons.warning_amber_rounded),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.headline3.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person, color: AppColors.textSecondary, size: 14),
              const SizedBox(width: 4),
              Text('Guru: $teacher', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 12),
          Text(desc, style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, height: 1.4)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.primaryGreen.withValues(alpha: 0.05) : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isCompleted ? AppColors.primaryGreen.withValues(alpha: 0.2) : Colors.transparent),
            ),
            child: Row(
              children: [
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Text(progressVal, style: AppTextStyles.headline3.copyWith(color: Colors.white, fontSize: 14)),
                  )
                else
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: CircularProgressIndicator(
                          value: double.parse(progressVal.replaceAll('%', '')) / 100,
                          backgroundColor: AppColors.borderLight,
                          color: AppColors.primaryBlue,
                          strokeWidth: 4,
                        ),
                      ),
                      Text(progressVal, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isCompleted ? 'Nilai Tugas' : 'Progres: $progressText', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Text(sisaText, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCompleted ? AppColors.backgroundLight : buttonColor,
                    foregroundColor: isCompleted ? AppColors.textPrimary : Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(buttonText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isCompleted ? AppColors.textPrimary : Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallBadge(String text, Color bgColor, Color textColor, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 12),
            const SizedBox(width: 4),
          ],
          Text(text, style: AppTextStyles.caption.copyWith(color: textColor, fontWeight: FontWeight.bold, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildNotificationTips() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.warningOrange.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_active, color: AppColors.warningOrange),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notifikasi Pengingat', style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Aktifkan notifikasi agar tidak terlewat tenggat waktu tugas harianmu.', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (val) {},
            activeThumbColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }
}

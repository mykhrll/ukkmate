import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class StatusSinkronisasiScreen extends StatelessWidget {
  const StatusSinkronisasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status Sinkronisasi', style: AppTextStyles.subtitle1),
            Text('Offline-First Engine Active', style: AppTextStyles.caption.copyWith(fontSize: 10)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.sync, color: AppColors.primaryBlue, size: 22),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOfflineStatusCard(),
            const SizedBox(height: 20),
            _buildStorageStats(),
            const SizedBox(height: 24),
            _buildQueueHeader(),
            const SizedBox(height: 16),
            _buildQueueItem(
              Icons.assignment,
              AppColors.primaryBlue,
              'Hasil Simulasi CBT RPL – Paket A',
              'Menunggu koneksi internet',
              'Dibuat: 10 menit lalu',
              Icons.bookmark_border,
            ),
            const SizedBox(height: 12),
            _buildQueueItem(
              Icons.person,
              AppColors.warningOrange,
              'Pembaruan Profil Siswa',
              'Menunggu koneksi',
              'Dibuat: 1 jam lalu',
              Icons.access_time,
            ),
            const SizedBox(height: 12),
            _buildQueueItem(
              Icons.timer,
              AppColors.primaryGreen,
              'Log Waktu Pengerjaan Sesi #3',
              'Menunggu koneksi',
              'Dibuat: 2 jam lalu',
              Icons.access_time,
            ),
            const SizedBox(height: 12),
            _buildQueueItem(
              Icons.quiz,
              Colors.purple,
              'Kuesioner Evaluasi Mandiri',
              'Menunggu koneksi',
              'Dibuat: Kemarin',
              Icons.schedule,
            ),
            const SizedBox(height: 24),
            _buildArchitectureInfo(),
            const SizedBox(height: 24),

            // Sync button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.sync, size: 18),
                label: const Text('Coba Sinkronisasi Sekarang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, color: AppColors.textSecondary, size: 14),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Sinkronisasi otomatis akan berjalan saat perangkat terhubung kembali ke jaringan Wi-Fi atau data seluler.',
                    style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.cloud_off, color: AppColors.primaryBlue, size: 28),
                  ),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.warningOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.priority_high, color: Colors.white, size: 10),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.warningOrange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.circle, color: AppColors.warningOrange, size: 8),
                    const SizedBox(width: 6),
                    Text('Mode Offline', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Data Tersimpan Aman', style: AppTextStyles.headline3.copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            'Mode Offline Aktif: Data latihan & ujian tersimpan aman di database lokal perangkat (SQLite/IndexedDB).',
            style: AppTextStyles.bodyText2.copyWith(color: AppColors.textSecondary, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.verified_user, color: AppColors.primaryGreen, size: 14),
              const SizedBox(width: 6),
              Text('Integritas Hash Terverifikasi Secara Lokal', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStorageStats() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.storage, color: AppColors.primaryBlue, size: 18),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('RPL', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: '120',
                    style: AppTextStyles.headline2.copyWith(fontSize: 28),
                    children: [
                      TextSpan(text: '\nSoal Tersimpan', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text('Paket UKK Terunduh', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 9)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.pending_actions, color: AppColors.warningOrange, size: 18),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.warningOrange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Antrean', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: '4',
                    style: AppTextStyles.headline2.copyWith(fontSize: 28),
                    children: [
                      TextSpan(text: ' Item\n', style: AppTextStyles.bodyText1.copyWith(fontSize: 14)),
                      TextSpan(text: 'Belum Tersinkron', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text('Prioritas Antrean 1', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 9)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQueueHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.sync_problem, color: AppColors.textPrimary, size: 18),
            const SizedBox(width: 8),
            Text('Menunggu Sinkronisasi ke\nServer', style: AppTextStyles.subtitle1.copyWith(fontSize: 14, height: 1.3)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Text('Auto-\nretry', style: AppTextStyles.caption.copyWith(fontSize: 10, height: 1.2)),
        ),
      ],
    );
  }

  Widget _buildQueueItem(IconData icon, Color color, String title, String status, String time, IconData trailing) {
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
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.subtitle2.copyWith(fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.circle, color: AppColors.warningOrange, size: 6),
                    const SizedBox(width: 4),
                    Text(status, style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(time, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10, fontFamily: 'monospace')),
              ],
            ),
          ),
          Icon(trailing, color: AppColors.textSecondary, size: 18),
        ],
      ),
    );
  }

  Widget _buildArchitectureInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          const Icon(Icons.architecture, color: AppColors.textPrimary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text('Arsitektur Offline & Alur\nSinkronisasi', style: AppTextStyles.bodyText1.copyWith(fontSize: 13, height: 1.3)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Buka\nDiagram', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 11, height: 1.2)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

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
              const SizedBox(height: 16),
              _buildSyncBanner(),
              const SizedBox(height: 24),
              _buildPortofolioSection(),
              const SizedBox(height: 24),
              _buildTabs(),
              const SizedBox(height: 24),
              _buildBigBlueCard(),
              const SizedBox(height: 24),
              _buildChartCard(),
              const SizedBox(height: 24),
              _buildUnitList(),
              const SizedBox(height: 24),
              _buildHistoryList(),
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
              child: const Icon(Icons.school, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('UKKMATE CBT', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                Text('Riwayat', style: AppTextStyles.headline3),
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
                  Text('Tersinkron', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold)),
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

  Widget _buildSyncBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_done, color: AppColors.primaryGreen, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Seluruh log penilaian offline tersinkronisasi',
              style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.successGreenBg,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('v2.4 OK', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _buildPortofolioSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PORTOFOLIO SISWA RPL', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Budi Santoso', style: AppTextStyles.headline3),
              const SizedBox(height: 4),
              Text('NISN: 0068492019 • SMK Negeri 2 Cimahi', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: const Icon(Icons.download, size: 16),
          label: const Text('Unduh Rapor'),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTabItem('Bulan Ini', true)),
          Expanded(child: _buildTabItem('Semester Genap', false)),
          Expanded(child: _buildTabItem('Sepanjang Masa', false)),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTextStyles.caption.copyWith(
          color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildBigBlueCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.verified, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text('Standar LSP - P1 BNSP', style: AppTextStyles.caption.copyWith(color: Colors.white)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Klaster: Web Dev', style: AppTextStyles.caption.copyWith(color: Colors.white, fontSize: 10)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Status Proyeksi Kelulusan', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.8))),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('SANGAT SIAP', style: AppTextStyles.headline3.copyWith(color: Colors.white, fontSize: 24)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('KOMPETEN', style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Berdasarkan capaian akumulatif, Anda berpeluang lulus predikat Unggul pada Uji Kompetensi Keahlian SMK 2026.',
            style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.9)),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.adjust, color: Colors.white, size: 14),
                          const SizedBox(width: 6),
                          Text('Skor Tertinggi', style: AppTextStyles.caption.copyWith(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: '92 ',
                          style: AppTextStyles.headline3.copyWith(color: Colors.white),
                          children: [
                            TextSpan(text: '/ 100', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.7))),
                          ],
                        ),
                      ),
                      Text('Paket A RPL (Fullstack)', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.7), fontSize: 10)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.history, color: Colors.white, size: 14),
                          const SizedBox(width: 6),
                          Text('Sesi CBT Selesai', style: AppTextStyles.caption.copyWith(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: '12 ',
                          style: AppTextStyles.headline3.copyWith(color: Colors.white),
                          children: [
                            TextSpan(text: 'Ujian', style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.7))),
                          ],
                        ),
                      ),
                      Text('100% Tuntas', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.trending_up, color: AppColors.primaryBlue),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tren Simulasi UKK', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
                    Text('Kurva Progres Skor Bulanan (Jan - Apr)', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('+26\nPoin', style: AppTextStyles.headline3.copyWith(color: AppColors.primaryBlue, fontSize: 16), textAlign: TextAlign.right),
                  Text('Peningkatan', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Placeholder for Chart - using an image or custom painter in real app
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Chart Placeholder', style: TextStyle(color: Colors.grey))),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.successGreenBg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_graph, color: AppColors.primaryGreen, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Konsistensi Positif! Nilai Anda melampaui KKM sejak Maret dan terus meningkat stabil +4 poin pada April.',
                    style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitList() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Penguasaan Unit SKKNI RPL', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
                    Text('Berdasarkan 4 Elemen Pokok Skema Junior Developer', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text('4', style: AppTextStyles.headline3.copyWith(color: AppColors.primaryBlue, fontSize: 14)),
                    Text('Unit', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildUnitItem('SANGAT MENGUASAI', AppColors.primaryGreen, 'Pemrograman Berorientasi Objek & M', '94%', 'J.620100.017.01 (OOP)', '16/17 Soal Benar', 0.94),
          const Divider(height: 32),
          _buildUnitItem('KOMPETEN', AppColors.primaryBlue, 'Perancangan Basis Data & SQL Query', '88%', 'J.620100.015.01 (Relational DB)', '14/16 Soal Benar', 0.88),
          const Divider(height: 32),
          _buildUnitItem('KOMPETEN', AppColors.primaryBlue, 'RESTful API & Integrasi Backend', '82%', 'J.620100.023.02 (API Services)', '13/16 Soal Benar', 0.82),
          const Divider(height: 32),
          _buildUnitItem('PERLU PENGUATAN', AppColors.warningOrange, 'Pengujian Sistem & Security', '68%', 'J.620100.025.01 (Unit Test & XSS)', 'Lebih Remedial →', 0.68),
        ],
      ),
    );
  }

  Widget _buildUnitItem(String status, Color statusColor, String title, String percentage, String code, String subtitleRight, double percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, color: statusColor, size: 8),
            const SizedBox(width: 8),
            Text(status, style: AppTextStyles.caption.copyWith(color: statusColor, fontWeight: FontWeight.bold, fontSize: 10)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold))),
            Text(percentage, style: AppTextStyles.headline3.copyWith(color: statusColor, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 8),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 6,
          percent: percent,
          backgroundColor: AppColors.borderLight,
          progressColor: statusColor,
          barRadius: const Radius.circular(3),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(code, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
            Text(subtitleRight, style: AppTextStyles.caption.copyWith(color: statusColor, fontWeight: FontWeight.bold, fontSize: 11)),
          ],
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return Column(
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
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.history, color: AppColors.primaryBlue, size: 16),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Riwayat Ujian Terakhir', style: AppTextStyles.headline3.copyWith(fontSize: 16)),
                    Text('Sesi simulasi & bank soal CBT', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11)),
                  ],
                ),
              ],
            ),
            Text('12 Total', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          ],
        ),
        const SizedBox(height: 16),
        _buildHistoryItem('#12', 'Simulasi Mandiri Paket A RPL', '12 Okt 2026 • 40 Butir Soal', '88', true),
        const SizedBox(height: 12),
        _buildHistoryItem('#11', 'Latihan Quiz Database & Query', '10 Okt 2026 • 25 Soal', '86', true),
        const SizedBox(height: 12),
        _buildHistoryItem('#10', 'Tryout Terjadwal Sekolah (S..', '05 Okt 2026 • 50 Soal', '92', true),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
              foregroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Muat Riwayat Lebih Lama (9 Sesi)'),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(String id, String title, String subtitle, String score, bool hasReviewBtn) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(id, style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: score,
                  style: AppTextStyles.headline3.copyWith(color: AppColors.primaryBlue, fontSize: 20),
                  children: [
                    TextSpan(text: ' / 100', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          if (hasReviewBtn) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.successGreenBg,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, color: AppColors.successGreenText, size: 8),
                      const SizedBox(width: 4),
                      Text('KOMPETEN', style: AppTextStyles.caption.copyWith(color: AppColors.successGreenText, fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    const Icon(Icons.cloud_done_outlined, color: AppColors.primaryGreen, size: 14),
                    const SizedBox(width: 4),
                    Text('Tersinkron', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10)),
                  ],
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.rate_review_outlined, size: 14),
                  label: const Text('Review Soal', style: TextStyle(fontSize: 11)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryBlue,
                    side: const BorderSide(color: AppColors.borderLight),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

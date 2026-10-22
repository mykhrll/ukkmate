import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/guru/guru_bank_soal_screen.dart';
import 'package:ukkmate/features/guru/guru_dashboard_screen.dart';

class GuruDaftarAsesiScreen extends StatelessWidget {
  const GuruDaftarAsesiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildSyncBanner(),
              _buildTeacherInfo(),
              _buildRombelChips(),
              _buildSummaryStats(),
              _buildSearchBar(),
              _buildFilterTabs(),
              _buildListHeader(),
              const SizedBox(height: 12),
              _buildStudentCard1(),
              const SizedBox(height: 10),
              _buildStudentCard2(),
              const SizedBox(height: 10),
              _buildStudentCard3(),
              const SizedBox(height: 20),
              _buildDownloadButton(),
              _buildSyncButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 20, 12),
      decoration: const BoxDecoration(color: AppColors.backgroundDark),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/logo.jpeg',
              width: 28,
              height: 28,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Portal Guru Pendamping', style: AppTextStyles.subtitle1.copyWith(color: Colors.white, fontSize: 14)),
                Row(
                  children: [
                    Text('SMKN 1', style: AppTextStyles.caption.copyWith(color: Colors.white60, fontSize: 10)),
                    const SizedBox(width: 6),
                    const Icon(Icons.circle, color: AppColors.primaryGreen, size: 6),
                    const SizedBox(width: 4),
                    Text('Online / Dapodik Terhubung', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryGreen.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.sync, color: AppColors.primaryGreen, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sinkronisasi Dapodik Aktif', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
                Text('Terakhir diperbarui: Hari ini, 07:45 WIB', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Terkoneksi', style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('Guru Penguji & Pembimbing', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 10)),
          ),
          const SizedBox(height: 8),
          Text('Drs. Ahmad Fauzi, M.Pd', style: AppTextStyles.headline3.copyWith(fontSize: 18)),
          Text('NIP. 19740512 200212 1 003 • Rekayasa', style: AppTextStyles.caption.copyWith(fontFamily: 'monospace', fontSize: 10)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('ROMBEL AKTIF UKK 2025', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10)),
              const SizedBox(width: 16),
              Text('Total: 72 Siswa', style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRombelChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildRombelChip('XII RPL 1', '36', false),
            const SizedBox(width: 8),
            _buildRombelChip('XII RPL 2', '36', true),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderLight),
              ),
              child: const Icon(Icons.more_horiz, color: AppColors.textSecondary, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRombelChip(String label, String count, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.primaryBlue : AppColors.borderLight),
      ),
      child: Row(
        children: [
          const Icon(Icons.class_, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.caption.copyWith(color: isSelected ? Colors.white : AppColors.textPrimary, fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withValues(alpha: 0.2) : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(count, style: AppTextStyles.caption.copyWith(color: isSelected ? Colors.white : AppColors.textSecondary, fontWeight: FontWeight.bold, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStats() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Siap UKK
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.primaryGreen, size: 16),
                      const Spacer(),
                      Text('86%', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('31', style: AppTextStyles.headline3.copyWith(fontSize: 22)),
                  Text('Siap UKK', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Perlu Remedial
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: AppColors.warningOrange, size: 16),
                      const Spacer(),
                      Text('14%', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('5', style: AppTextStyles.headline3.copyWith(fontSize: 22)),
                  Text('Perlu Remedial', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Berkas Masuk
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.folder_open, color: AppColors.primaryBlue, size: 16),
                      const Spacer(),
                      Text('100%', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('36', style: AppTextStyles.headline3.copyWith(fontSize: 22)),
                  Text('Berkas Masuk', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: AppColors.textSecondary, size: 20),
            hintText: 'Cari siswa, NISN, atau modul...',
            hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('Semua (36)', true),
            const SizedBox(width: 8),
            _buildFilterChip('Siap UKK (31)', false),
            const SizedBox(width: 8),
            _buildFilterChip('Perlu Remedial (5)', false),
            const SizedBox(width: 8),
            _buildFilterChip('P...', false),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.primaryBlue : AppColors.borderLight),
      ),
      child: Text(text, style: AppTextStyles.caption.copyWith(color: isSelected ? Colors.white : AppColors.textPrimary, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
    );
  }

  Widget _buildListHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text('Daftar Asesi\nBinaan', style: AppTextStyles.subtitle1.copyWith(fontSize: 14, height: 1.3)),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('3\nSiswa', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 9, height: 1.3)),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Urutan:', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              Row(
                children: [
                  Text('Nilai\nTertinggi', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10, height: 1.2)),
                  const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard1() {
    return _buildAsesiCard(
      name: 'Siti Nurhaliza',
      nisn: '0067341892',
      kelas: 'XII RPL 2',
      score: '94',
      status: 'Sangat Siap',
      statusColor: AppColors.primaryGreen,
      portfolio: 'Portofolio: Full-stack ERP (Laravel & Vue)',
      portfolioColor: AppColors.primaryBlue,
      detail: 'Semua 12 Unit SKKNI Tuntas',
      actionText: 'Detail Progres >',
      isTop: true,
      topLabel: '☆ Top 5%',
    );
  }

  Widget _buildStudentCard2() {
    return _buildAsesiCard(
      name: 'Budi Santoso',
      nisn: '0068492019',
      kelas: 'XII RPL 2',
      score: '88',
      status: 'Siap UKK',
      statusColor: AppColors.primaryGreen,
      portfolio: 'GitHub REST API: Verified Repository',
      portfolioColor: AppColors.backgroundDark,
      detail: '11 dari 12 Unit Terverifikasi',
      actionText: 'Detail Progres >',
    );
  }

  Widget _buildStudentCard3() {
    return _buildAsesiCard(
      name: 'Dimas Prasetyo',
      nisn: '0068331190',
      kelas: 'XII RPL 2',
      score: '72',
      status: 'Pantauan Khusus',
      statusColor: AppColors.warningOrange,
      portfolio: 'Portofolio Dokumen UKK & Swagger belum diserahkan',
      portfolioColor: AppColors.warningOrange,
      detail: null,
      actionText: 'Detail Progres >',
      showReminder: true,
    );
  }

  Widget _buildAsesiCard({
    required String name,
    required String nisn,
    required String kelas,
    required String score,
    required String status,
    required Color statusColor,
    required String portfolio,
    required Color portfolioColor,
    required String? detail,
    required String actionText,
    bool isTop = false,
    String? topLabel,
    bool showReminder = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
                backgroundImage: const AssetImage('assets/pp_default_laki-laki.jpg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text(name, style: AppTextStyles.subtitle1.copyWith(fontSize: 14))),
                        if (isTop && topLabel != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.warningOrange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(topLabel, style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9)),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('NISN:\n$nisn', style: AppTextStyles.caption.copyWith(fontFamily: 'monospace', fontSize: 10, height: 1.3)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(kelas, style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: score,
                      style: AppTextStyles.headline3.copyWith(fontSize: 22),
                      children: [
                        TextSpan(text: '/100', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(status, style: AppTextStyles.caption.copyWith(color: statusColor, fontWeight: FontWeight.bold, fontSize: 9)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: portfolioColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(showReminder ? Icons.warning_amber_rounded : Icons.code, color: portfolioColor, size: 14),
                const SizedBox(width: 6),
                Expanded(child: Text(portfolio, style: AppTextStyles.caption.copyWith(color: portfolioColor, fontSize: 10))),
              ],
            ),
          ),
          if (detail != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle_outline, color: AppColors.primaryGreen, size: 14),
                const SizedBox(width: 6),
                Text(detail, style: AppTextStyles.caption.copyWith(fontSize: 10)),
              ],
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              if (showReminder)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send, color: AppColors.primaryBlue, size: 14),
                        const SizedBox(width: 6),
                        Text('Kirim Pengingat', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              if (showReminder) const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(actionText, style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
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

  Widget _buildDownloadButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Icon(Icons.download, size: 18),
          label: const Text('Unduh Rekap Absensi & Kesiapan\n(Excel/PDF)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildSyncButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: AppColors.borderLight),
          ),
          icon: const Icon(Icons.sync, size: 16),
          label: const Text('Sinkronkan Daftar Siswa dari Dapodik', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderLight, width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.primaryBlue.withValues(alpha: 0.05),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.primaryBlue, size: 14),
                const SizedBox(width: 6),
                Text('Menampilkan data kelas XII RPL 2', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontSize: 10)),
              ],
            ),
          ),
          BottomNavigationBar(
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: AppColors.primaryBlue,
            unselectedItemColor: AppColors.textSecondary,
            selectedLabelStyle: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10),
            unselectedLabelStyle: AppTextStyles.caption.copyWith(fontSize: 10),
            onTap: (index) {
              if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const GuruBankSoalScreen()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const GuruDashboardScreen()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.class_), label: 'Kelas'),
              BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Bank Soal'),
              BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Pantauan'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
            ],
          ),
        ],
      ),
    );
  }
}

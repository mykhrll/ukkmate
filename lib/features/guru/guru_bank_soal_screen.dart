import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/guru/guru_dashboard_screen.dart';
import 'package:ukkmate/features/guru/guru_daftar_asesi_screen.dart';

class GuruBankSoalScreen extends StatefulWidget {
  final bool embedded;
  const GuruBankSoalScreen({super.key, this.embedded = false});

  @override
  State<GuruBankSoalScreen> createState() => _GuruBankSoalScreenState();
}

class _GuruBankSoalScreenState extends State<GuruBankSoalScreen> {
  int _selectedFilter = 0; // 0: Semua Modul, 1: RPL, 2: TKJ
  int _selectedTimer = 1; // 0: 60m, 1: 90m, 2: 120m
  bool _targetRpl1 = true;
  bool _targetRpl2 = true;
  bool _randomizeQuestions = true;
  bool _offlineEncryption = true;

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
              _buildTopHeroCard(),
              _buildFilterChips(),
              const SizedBox(height: 16),
              _buildPaketA(),
              const SizedBox(height: 16),
              _buildPaketB(),
              const SizedBox(height: 16),
              _buildPaketC(),
              const SizedBox(height: 16),
              _buildGladiBersih(),
              const SizedBox(height: 20),
              _buildDistribusiLabCard(),
              const SizedBox(height: 16),
              _buildRubrikBanner(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.embedded ? null : _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
      ),
      child: Row(
        children: [
          if (!widget.embedded)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/logo.jpeg', width: 32, height: 32, fit: BoxFit.cover),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, color: AppColors.primaryGreen, size: 5),
                          const SizedBox(width: 4),
                          Text('Online / Dapodik Terhubung', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 9, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.sync, color: Colors.white, size: 20),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menyinkronkan bank soal dengan server sekolah...')),
              );
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
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

  Widget _buildTopHeroCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
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
                    const Icon(Icons.circle, color: AppColors.primaryGreen, size: 8),
                    const SizedBox(width: 6),
                    Text('LOKAL CACHE TERVERIFIKASI', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 0.5)),
                  ],
                ),
                Text('v4.2-BNSP', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontFamily: 'monospace', fontSize: 11)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bank Soal Kejuruan', style: AppTextStyles.headline2.copyWith(fontSize: 20)),
                      const SizedBox(height: 4),
                      Text('Materi & Simulasi UKK RPL & TKJ Standar SKKNI', style: AppTextStyles.caption.copyWith(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('160', style: AppTextStyles.headline1.copyWith(color: AppColors.primaryBlue, fontSize: 26)),
                    Text('Butir Soal\nAktif', textAlign: TextAlign.right, style: AppTextStyles.caption.copyWith(fontSize: 10, height: 1.1)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.infoBlueBg.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.15)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.folder_copy_outlined, color: AppColors.primaryBlue, size: 20),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('4 Paket', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
                            Text('Siap Uji CBT', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.successGreenBg.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryGreen.withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.verified_outlined, color: AppColors.primaryGreen, size: 20),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('100% Valid', style: AppTextStyles.subtitle2.copyWith(fontSize: 12, color: AppColors.successGreenText)),
                            Text('Rubrik Asesor', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.add_circle_outline, size: 16),
                    label: const Text('Buat Paket Baru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                      side: const BorderSide(color: AppColors.primaryBlue),
                      backgroundColor: AppColors.infoBlueBg.withValues(alpha: 0.3),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    icon: const Icon(Icons.description_outlined, size: 16),
                    label: const Text('Impor Soal Excel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildChip('Semua Modul (4)', Icons.view_headline, _selectedFilter == 0, () => setState(() => _selectedFilter = 0)),
          const SizedBox(width: 8),
          _buildChip('RPL (Software)', Icons.code, _selectedFilter == 1, () => setState(() => _selectedFilter = 1)),
          const SizedBox(width: 8),
          _buildChip('TKJ (Jaringan)', Icons.dns, _selectedFilter == 2, () => setState(() => _selectedFilter = 2)),
        ],
      ),
    );
  }

  Widget _buildChip(String label, IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppColors.primaryBlue : AppColors.borderLight),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: isSelected ? Colors.white : AppColors.textSecondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaketA() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                _buildTag('RPL', AppColors.primaryBlue.withValues(alpha: 0.1), AppColors.primaryBlue),
                const SizedBox(width: 6),
                _buildTag('BNSP 2026', AppColors.primaryGreen.withValues(alpha: 0.1), AppColors.primaryGreen),
                const Spacer(),
                const Icon(Icons.circle, color: AppColors.primaryGreen, size: 8),
                const SizedBox(width: 4),
                Text('Aktif', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 11)),
              ],
            ),
            const SizedBox(height: 10),
            Text('Paket A: Pemrograman Web & REST API', style: AppTextStyles.subtitle1.copyWith(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Studi kasus microservices, otentikasi JWT, dan validasi skema database.', style: AppTextStyles.caption.copyWith(fontSize: 11)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('Jumlah Soal', '40 Butir'),
                  _buildStatItem('Durasi', '90 Menit'),
                  _buildStatItem('KKM Kelulusan', '75.00', valueColor: AppColors.primaryBlue),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.groups_outlined, color: AppColors.primaryBlue, size: 14),
                  const SizedBox(width: 6),
                  Text('Didistribusikan ke: XII RPL 1 & XII RPL 2 (72 Siswa)', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.alarm, size: 15),
                    label: const Text('Jadwalkan CBT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.borderLight),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    icon: const Icon(Icons.edit_note, size: 16),
                    label: const Text('Edit Butir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaketB() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                _buildTag('TKJ', AppColors.primaryOrange.withValues(alpha: 0.1), AppColors.primaryOrange),
                const SizedBox(width: 6),
                _buildTag('Uji Teori Praktik', AppColors.primaryBlue.withValues(alpha: 0.1), AppColors.primaryBlue),
                const Spacer(),
                Text('Tersedia di Bank Soal', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              ],
            ),
            const SizedBox(height: 10),
            Text('Paket B: Server Linux & Nginx Gateway', style: AppTextStyles.subtitle1.copyWith(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Konfigurasi DNS BIND9, Reverse Proxy SSL, firewall IPtables & routing.', style: AppTextStyles.caption.copyWith(fontSize: 11)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('Jumlah Soal', '40 Butir'),
                  _buildStatItem('Durasi', '90 Menit'),
                  _buildStatItem('KKM Target', '78.00', valueColor: AppColors.primaryBlue),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.check_circle_outline, color: AppColors.primaryGreen, size: 14),
                const SizedBox(width: 4),
                Text('Kunci Jawaban Terenkripsi', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.send, size: 14),
                  label: const Text('Kirim ke Siswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaketC() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                _buildTag('RPL', AppColors.primaryBlue.withValues(alpha: 0.1), AppColors.primaryBlue),
                const SizedBox(width: 6),
                _buildTag('Remedial Mandiri', AppColors.warningOrange.withValues(alpha: 0.1), AppColors.warningOrange),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.warningOrange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('14 Siswa Aktif', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Paket C: SQLite & Normalisasi 3NF', style: AppTextStyles.subtitle1.copyWith(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Penajaman DDL, DML, relasi foreign key kaskade, dan index clustering.', style: AppTextStyles.caption.copyWith(fontSize: 11)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildMiniBadge(Icons.article_outlined, '30 Butir Soal'),
                const SizedBox(width: 12),
                _buildMiniBadge(Icons.access_time, '60 Menit'),
                const SizedBox(width: 12),
                _buildMiniBadge(Icons.check, 'KKM 75', isGreen: true),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                      backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.05),
                      side: BorderSide(color: AppColors.primaryBlue.withValues(alpha: 0.3)),
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    icon: const Icon(Icons.insights, size: 16),
                    label: const Text('Pantau Hasil (14)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: const Icon(Icons.tune, color: AppColors.textSecondary, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGladiBersih() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                _buildTag('SIMULASI', AppColors.primaryBlue.withValues(alpha: 0.1), AppColors.primaryBlue),
                const SizedBox(width: 6),
                _buildTag('Browser Safe', AppColors.backgroundDark.withValues(alpha: 0.1), AppColors.backgroundDark),
                const Spacer(),
                Text('20 Okt 2026', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              ],
            ),
            const SizedBox(height: 10),
            Text('Simulasi Gladi Bersih CBT Teori 2026', style: AppTextStyles.subtitle1.copyWith(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Seluruh kompetensi dasar RPL: Algoritma, OOP Java/Dart, dan Rekayasa Perangkat Lunak.', style: AppTextStyles.caption.copyWith(fontSize: 11)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildMiniBadge(Icons.military_tech_outlined, '50 Butir Soal Teori'),
                const SizedBox(width: 12),
                _buildMiniBadge(Icons.shield_outlined, 'Kiosk Anti-Contek Aktif', isRed: true),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(color: AppColors.borderLight),
                backgroundColor: AppColors.backgroundLight,
                padding: const EdgeInsets.symmetric(vertical: 9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(double.infinity, 38),
              ),
              icon: const Icon(Icons.visibility_outlined, size: 16),
              label: const Text('Pratinjau Lembar Soal Peserta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDistribusiLabCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.devices, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Distribusi Lab Komputer', style: AppTextStyles.subtitle1.copyWith(fontSize: 14)),
                      Text('Kirim lembar ujian langsung ke terminal siswa', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('ROMBEL TARGET UJIAN', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 0.5)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCheckbox('XII RPL 1 (Lab 01)', _targetRpl1, (val) => setState(() => _targetRpl1 = val ?? false)),
                const SizedBox(width: 12),
                _buildCheckbox('XII RPL 2 (Lab 02)', _targetRpl2, (val) => setState(() => _targetRpl2 = val ?? false)),
              ],
            ),
            const SizedBox(height: 14),
            Text('BATAS TIMER PENGERJAAN', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 0.5)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildTimerChip('60 Menit', _selectedTimer == 0, () => setState(() => _selectedTimer = 0)),
                const SizedBox(width: 8),
                _buildTimerChip('90 Menit', _selectedTimer == 1, () => setState(() => _selectedTimer = 1)),
                const SizedBox(width: 8),
                _buildTimerChip('120 Menit', _selectedTimer == 2, () => setState(() => _selectedTimer = 2)),
              ],
            ),
            const SizedBox(height: 14),
            // Toggles
            _buildSwitchItem(
              icon: Icons.shuffle,
              title: 'Acak Urutan Butir & Opsi',
              subtitle: 'Cegah kesamaan layar antar meja peserta',
              value: _randomizeQuestions,
              onChanged: (val) => setState(() => _randomizeQuestions = val),
            ),
            const Divider(height: 14),
            _buildSwitchItem(
              icon: Icons.lock_outline,
              title: 'Enkripsi SQLite Offline Local',
              subtitle: 'Ujian tetap berjalan jika Wi-Fi sekolah putus',
              value: _offlineEncryption,
              onChanged: (val) => setState(() => _offlineEncryption = val),
              isGreen: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Paket ujian berhasil didistribusikan ke 72 workstation lab!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 44),
                elevation: 0,
              ),
              icon: const Icon(Icons.cloud_upload_outlined, size: 18),
              label: const Text('Kirim Ujian ke Semua Terminal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRubrikBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.verified, color: AppColors.primaryGreen, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rubrik Penilaian Asesor BNSP', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
                  Text('Matriks KUK (Kriteria Unjuk Kerja) Standar SKKNI', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.primaryBlue, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 9)),
    );
  }

  Widget _buildStatItem(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption.copyWith(fontSize: 9)),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.subtitle2.copyWith(fontSize: 11, color: valueColor ?? AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildMiniBadge(IconData icon, String text, {bool isGreen = false, bool isRed = false}) {
    Color color = isGreen ? AppColors.primaryGreen : (isRed ? AppColors.errorRed : AppColors.textSecondary);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyles.caption.copyWith(fontSize: 10, color: color, fontWeight: (isGreen || isRed) ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value, ValueChanged<bool?> onChanged) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: value ? AppColors.primaryBlue : AppColors.borderLight),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primaryBlue,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Text(label, style: AppTextStyles.caption.copyWith(fontSize: 10, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerChip(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? AppColors.primaryBlue : AppColors.borderLight),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isGreen = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: isGreen ? AppColors.primaryGreen : AppColors.primaryBlue),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.subtitle2.copyWith(fontSize: 11)),
              Text(subtitle, style: AppTextStyles.caption.copyWith(fontSize: 9)),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: isGreen ? AppColors.primaryGreen : AppColors.primaryBlue,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderLight, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: 1, // Bank Soal
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: AppTextStyles.caption.copyWith(fontSize: 10),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GuruDaftarAsesiScreen()),
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
    );
  }
}

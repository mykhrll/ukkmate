import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/guru/guru_daftar_asesi_screen.dart';

class GuruDashboardScreen extends StatelessWidget {
  const GuruDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildTeacherInfo(),
              _buildFilterSection(),
              _buildProgressSection(),
              _buildQuickActions(),
              _buildLiveMonitor(),
              _buildSchoolBanner(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/logo.jpeg', width: 24, height: 24, errorBuilder: (_, __, ___) => const Icon(Icons.school, color: Colors.white, size: 24)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Portal Guru Pendamping', style: AppTextStyles.subtitle1.copyWith(color: Colors.white, fontSize: 14)),
                Text('NIP. 19878422  SMKN 1 Kotabumi', style: AppTextStyles.caption.copyWith(color: Colors.white60, fontSize: 9, fontFamily: 'monospace')),
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

  Widget _buildTeacherInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text('Drs. Ahmad Fauzi, M.Kom', style: AppTextStyles.subtitle1.copyWith(fontSize: 14))),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Online', style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('NIP. 197885122003121002', style: AppTextStyles.caption.copyWith(fontFamily: 'monospace', fontSize: 10)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.verified, color: AppColors.primaryGreen, size: 12),
                    const SizedBox(width: 4),
                    Text('Guru Pendamping UKK RPL & TKJ', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.dns, color: AppColors.textSecondary, size: 12),
                    const SizedBox(width: 4),
                    Text('Server SMKN 1', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
                const Icon(Icons.filter_list, color: AppColors.textSecondary, size: 16),
                const SizedBox(width: 6),
                Text('Filter Kelompok Siswa', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('Tersinkron 09.42 WIB', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 10)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Target Kelas', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                            Text('XII RPL 1 & 2', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Periode UKK', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                            Text('Gel. 1 – 2026', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.calendar_today, color: AppColors.textSecondary, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progres Kelayakan UKK', style: AppTextStyles.subtitle1.copyWith(fontSize: 15)),
              Text('Detail Rombel', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Total Binaan
              Expanded(
                child: _buildStatCard(
                  'Total Binaan', '72', 'Siswa', '2 Rombel aktif praktikum',
                  AppColors.primaryBlue, Icons.people,
                ),
              ),
              const SizedBox(width: 10),
              // Siap UKK
              Expanded(
                child: _buildStatCard(
                  'Siap UKK', '58', null, 'Memenuhi standar BNSP',
                  AppColors.primaryGreen, Icons.check_circle,
                  percentage: '80.5%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              // Remidial
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.warningOrange.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.warningOrange.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Remidial', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontWeight: FontWeight.bold)),
                          const Icon(Icons.warning_amber_rounded, color: AppColors.warningOrange, size: 18),
                        ],
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: '14 ',
                          style: AppTextStyles.headline2.copyWith(fontSize: 28, color: AppColors.warningOrange),
                          children: [
                            TextSpan(text: 'Siswa', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange)),
                          ],
                        ),
                      ),
                      Text('Perlu bimbingan lab', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Rerata CBT
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rerata CBT', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
                          const Icon(Icons.bar_chart, color: AppColors.primaryBlue, size: 18),
                        ],
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: '84.6',
                          style: AppTextStyles.headline2.copyWith(fontSize: 28),
                          children: [
                            TextSpan(text: '/100', style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      Text('+4.2 dari simulasi 1', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
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

  Widget _buildStatCard(String title, String value, String? unit, String subtitle, Color color, IconData icon, {String? percentage}) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
              Icon(icon, color: color, size: 18),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: AppTextStyles.headline2.copyWith(fontSize: 28)),
              if (unit != null) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(unit, style: AppTextStyles.caption),
                ),
              ],
              if (percentage != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(percentage, style: AppTextStyles.caption.copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTextStyles.caption.copyWith(fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aksi Cepat Guru', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.send, size: 16),
                  label: const Text('Kirim Paket Simulasi Baru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: const BorderSide(color: AppColors.borderLight),
                  ),
                  icon: const Icon(Icons.bar_chart, size: 16),
                  label: const Text('Rekap Nilai (…)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLiveMonitor() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Pantauan Ujian Langsung', style: AppTextStyles.subtitle1.copyWith(fontSize: 15)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.errorRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle, color: AppColors.errorRed, size: 6),
                    const SizedBox(width: 4),
                    Text('Live Monitor', style: AppTextStyles.caption.copyWith(color: AppColors.errorRed, fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Student 1 - Budi Santoso
          _buildStudentCard(
            name: 'Budi Santoso',
            nisn: '222310452',
            kelas: 'XII RPL 2',
            score: '88',
            status: 'KOMPETEN',
            statusColor: AppColors.primaryGreen,
            detail: 'Selesai: Paket A (Rest API & DB)',
            actionText: 'Log Ujian>',
            isVerified: true,
          ),
          const SizedBox(height: 10),

          // Student 2 - Siti Nurhaliza
          _buildStudentCard(
            name: 'Siti Nurhaliza',
            nisn: '222310488',
            kelas: 'XII RPL 2',
            score: '94',
            status: 'KOMPETEN',
            statusColor: AppColors.primaryGreen,
            detail: 'Selesai: Paket A & B (Fullstack)',
            actionText: 'Portofolio>',
            isTop: true,
            topLabel: 'TOP 5%',
          ),
          const SizedBox(height: 10),

          // Student 3 - Rizky Ramadhan
          _buildStudentCard(
            name: 'Rizky Ramadhan',
            nisn: '222310461',
            kelas: 'XII RPL 1',
            score: '68',
            status: 'BELUM KOMPETEN',
            statusColor: AppColors.errorRed,
            detail: 'Perlu remidial modul: Normalisasi Basis Data & SQL Query JOIN',
            actionText: 'Beri Tugas Lab',
            isWarning: true,
            warningDetail: 'Jadwal Remidial: Besok 13.00',
          ),
          const SizedBox(height: 10),

          // Student 4 - Putri Andini (Live)
          _buildLiveStudentCard(),
        ],
      ),
    );
  }

  Widget _buildStudentCard({
    required String name,
    required String nisn,
    required String kelas,
    required String score,
    required String status,
    required Color statusColor,
    required String detail,
    required String actionText,
    bool isVerified = false,
    bool isTop = false,
    String? topLabel,
    bool isWarning = false,
    String? warningDetail,
  }) {
    return Container(
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
              CircleAvatar(
                radius: 20,
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
                        Flexible(child: Text(name, style: AppTextStyles.subtitle2.copyWith(fontSize: 13))),
                        if (isVerified) ...[
                          const SizedBox(width: 4),
                          const Icon(Icons.verified, color: AppColors.primaryGreen, size: 14),
                        ],
                        if (isTop && topLabel != null) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.warningOrange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(topLabel, style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8)),
                          ),
                        ],
                      ],
                    ),
                    Text('NIS. $nisn  •  $kelas', style: AppTextStyles.caption.copyWith(fontFamily: 'monospace', fontSize: 10)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: score,
                      style: AppTextStyles.headline3.copyWith(fontSize: 20),
                      children: [
                        TextSpan(text: ' /100', style: AppTextStyles.caption.copyWith(fontSize: 10)),
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
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(isWarning ? Icons.warning_amber_rounded : Icons.check_circle_outline, color: isWarning ? AppColors.warningOrange : AppColors.primaryGreen, size: 14),
              const SizedBox(width: 6),
              Expanded(child: Text(detail, style: AppTextStyles.caption.copyWith(fontSize: 10))),
              Text(actionText, style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10)),
            ],
          ),
          if (isWarning && warningDetail != null) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.schedule, color: AppColors.textSecondary, size: 12),
                const SizedBox(width: 4),
                Text(warningDetail, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('Beri Tugas Lab', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10)),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLiveStudentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
                backgroundImage: const AssetImage('assets/pp_default_perempuan.jpg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Putri Andini', style: AppTextStyles.subtitle2.copyWith(fontSize: 13)),
                        const SizedBox(width: 4),
                        const Icon(Icons.circle, color: AppColors.primaryGreen, size: 8),
                      ],
                    ),
                    Text('NIS. 222310477  •  XII RPL 1', style: AppTextStyles.caption.copyWith(fontFamily: 'monospace', fontSize: 10)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer, color: AppColors.primaryBlue, size: 12),
                    const SizedBox(width: 4),
                    Text('45m 18s', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontFamily: 'monospace', fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Sesi Ujian 2', style: AppTextStyles.caption.copyWith(fontSize: 10)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.play_circle_outline, color: AppColors.primaryBlue, size: 14),
              const SizedBox(width: 4),
              Text('Simulasi CBT Paket B (Backend Laravel)', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              const SizedBox(width: 8),
              Text('32', style: AppTextStyles.subtitle2.copyWith(fontSize: 12)),
              Text(' / 40 Soal', style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.computer, color: AppColors.textSecondary, size: 14),
              const SizedBox(width: 4),
              Text('Lab Komputer 03  •  PC-14', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              const Spacer(),
              Text('Pantau Layar', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10)),
              const Icon(Icons.verified_user, color: AppColors.primaryGreen, size: 12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSchoolBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryGreen.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            const Icon(Icons.school, color: AppColors.primaryGreen),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SMKN 1 Kotabumi', style: AppTextStyles.subtitle2.copyWith(fontSize: 13)),
                  Text('Tingkat kesiapan UKK meningkat 12% dibanding tahun ajaran lalu.', style: AppTextStyles.caption.copyWith(fontSize: 10)),
                ],
              ),
            ),
          ],
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
      child: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: AppTextStyles.caption.copyWith(fontSize: 10),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GuruDaftarAsesiScreen()),
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

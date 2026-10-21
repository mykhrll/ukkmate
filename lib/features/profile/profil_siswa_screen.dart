import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class ProfilSiswaScreen extends StatelessWidget {
  const ProfilSiswaScreen({super.key});

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
        title: Text('Profil Siswa & Validasi NISN', style: AppTextStyles.subtitle1),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
              backgroundColor: AppColors.borderLight,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top banner badges
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildTopBadge(Icons.link, 'Bank Soal Tersimpan Lokal', AppColors.primaryGreen),
                  const Spacer(),
                  _buildSmallTag('SMK'),
                  const SizedBox(width: 6),
                  _buildSmallTag('TKJ/RPL'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Profile avatar section
            _buildProfileAvatar(),
            const SizedBox(height: 24),

            // Data Akademik section
            _buildAcademicDataSection(),
            const SizedBox(height: 16),

            // Formulir Data Pribadi section
            _buildPersonalDataSection(),
            const SizedBox(height: 24),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
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
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text('Simpan Perubahan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: const BorderSide(color: AppColors.borderLight),
                      ),
                      icon: const Icon(Icons.sync, size: 18),
                      label: const Text('Sinkronisasi Ulang Data NISN', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBadge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 6),
          Text(text, style: AppTextStyles.caption.copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildSmallTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }

  Widget _buildProfileAvatar() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.3), width: 3),
              ),
              child: const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/pp_default_laki-laki.jpg'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('Budi Santoso', style: AppTextStyles.headline3),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.verified, color: AppColors.primaryGreen, size: 16),
            const SizedBox(width: 4),
            Text('Terverifikasi Dapodik', style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        Text('NISN: 0061928374', style: AppTextStyles.bodyText2.copyWith(fontFamily: 'monospace', fontSize: 13, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildAcademicDataSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          children: [
            // Section header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.school, color: AppColors.primaryBlue, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Data Akademik\nSiswa', style: AppTextStyles.subtitle1.copyWith(fontSize: 16, height: 1.3)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock, color: AppColors.primaryBlue, size: 12),
                        const SizedBox(width: 4),
                        Text('Data\nTerkunci', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 10, height: 1.2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.borderLight),

            // Asal Sekolah
            _buildAcademicRow('Asal Sekolah', 'SMK Negeri 1 Cibinong', null),
            const Divider(height: 1, indent: 20, endIndent: 20, color: AppColors.borderLight),

            // Kompetensi Keahlian
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kompetensi Keahlian (Jurusan)', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                      const Icon(Icons.info_outline, color: AppColors.textSecondary, size: 16),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Rekayasa Perangkat Lunak (RPL)', style: AppTextStyles.subtitle2.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.lock, color: AppColors.warningOrange, size: 12),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Terkunci Otomatis dari NISN. Hubungi admin prodi sekolah untuk permohonan mutasi keahlian.',
                          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, indent: 20, endIndent: 20, color: AppColors.borderLight),

            // Tingkat/Rombel & Status UKK
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tingkat / Rombel', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 4),
                        Text('XII RPL 2', style: AppTextStyles.subtitle1.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status Akun UKK', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.circle, color: AppColors.primaryGreen, size: 8),
                            const SizedBox(width: 6),
                            Text('Aktif (Offline)', style: AppTextStyles.subtitle1.copyWith(fontSize: 14, color: AppColors.primaryGreen)),
                          ],
                        ),
                      ],
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

  Widget _buildAcademicRow(String label, String value, IconData? trailingIcon) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: AppTextStyles.subtitle2.copyWith(fontSize: 14)),
              if (trailingIcon != null) Icon(trailingIcon, color: AppColors.textSecondary, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDataSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.warningOrange.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.description, color: AppColors.warningOrange, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Formulir Data\nPribadi', style: AppTextStyles.subtitle1.copyWith(fontSize: 16, height: 1.3)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Terkunci Otomatis\ndari NISN', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 9, height: 1.3)),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.borderLight),

            // Jenis Kelamin
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jenis Kelamin', style: AppTextStyles.subtitle2),
                      Text('Sesuai Dapodik Kemendikbud', style: AppTextStyles.caption.copyWith(fontSize: 9)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.3)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.male, color: AppColors.primaryBlue, size: 16),
                              const SizedBox(width: 6),
                              Text('Laki-Laki', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              const Icon(Icons.verified, color: AppColors.primaryGreen, size: 14),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.borderLight),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.female, color: AppColors.textSecondary, size: 16),
                              const SizedBox(width: 6),
                              Text('Perempuan', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(width: 4),
                              const Icon(Icons.lock, color: AppColors.textSecondary, size: 12),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.borderLight),

            // Validasi Terpadu notice
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryGreen.withValues(alpha: 0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.verified_user, color: AppColors.primaryGreen, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Validasi Terpadu: Seluruh data identitas siswa disinkronkan secara aman dengan server Dapodik NISN Kemendikbudristek dan tersimpan offline untuk ujian praktik.',
                        style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, fontSize: 11, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

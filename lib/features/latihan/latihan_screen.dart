import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({super.key});

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
              _buildOfflineCard(),
              const SizedBox(height: 16),
              _buildStatsRow(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildFilterChips(),
              const SizedBox(height: 16),
              _buildSegmentedTabs(),
              const SizedBox(height: 24),
              _buildListHeader(),
              const SizedBox(height: 16),
              _buildPackageCard(
                'Paket A: Pemrograman Web & REST API',
                'Studi kasus otentikasi JWT, endpoint Express.js, query relasional ORM, dan pengujian API menggunakan Postman.',
                'RPL',
                'Kasus UKK (Mahir)',
                true,
                '40 Soal',
                '90 Menit',
                '85%',
                'Kisi-kisi BNSP 2026',
                false,
                false,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                'Paket B: Administrasi Server Linux & Nginx',
                'Konfigurasi Reverse Proxy Nginx, izin berkas chmod/chown, DNS bind9, dan troubleshooting layanan systemctl.',
                'TKJ',
                'Level 2 (Menengah)',
                true,
                '40 Soal',
                '90 Menit',
                '78%',
                'Diperbarui 2 hari lalu',
                false,
                false,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                'Paket C: Database Relasional SQLite & Normalisasi',
                'Kaidah bentuk normal 1NF sampai 3NF, sintaks DDL/DML kompleks, indexing primary & foreign key, serta optimasi query.',
                'RPL',
                'Level 1 (Dasar)',
                false,
                '30 Soal',
                '60 Menit',
                null,
                'Unduh untuk offline',
                true,
                false,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                'Paket D: Konfigurasi Routing MikroTik & VLAN',
                'Implementasi OSPF, VLAN Trunking 802.1Q, firewall filter rules, serta skema hotspot captive portal SMK.',
                'TKJ',
                'Kasus UKK (Mahir)',
                false,
                '40 Soal',
                '90 Menit',
                null,
                'Tersedia untuk Uji Coba',
                false,
                true,
              ),
              const SizedBox(height: 24),
              _buildTipsCard(),
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
                Text(
                  'UKKMATE CBT',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Latihan', style: AppTextStyles.headline3),
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
                  const Icon(
                    Icons.circle,
                    color: AppColors.successGreenText,
                    size: 8,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Tersinkron',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.successGreenText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

  Widget _buildOfflineCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.cloud_download, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'OFFLINE-READY CACHE',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.circle,
                            color: AppColors.primaryGreen,
                            size: 6,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '4 Paket Soal Tersimpan',
                        style: AppTextStyles.headline3.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '120 butir soal siap dikerjakan tanpa kuota internet.',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.sd_storage, color: Colors.white, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      '14.8 MB terpakai',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sync,
                        color: AppColors.primaryBlue,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Sinkronkan Bank Soal',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primaryBlue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dikerjakan',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '142 ',
                        style: AppTextStyles.headline3.copyWith(fontSize: 18),
                        children: [
                          TextSpan(
                            text: '/ 200',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.successGreenBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: AppColors.primaryGreen,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rerata Akurasi',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '88% ',
                        style: AppTextStyles.headline3.copyWith(
                          fontSize: 18,
                          color: AppColors.primaryGreen,
                        ),
                        children: [
                          TextSpan(
                            text: 'UKK',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.textSecondary),
          hintText: 'Cari materi, paket soal UKK, topik...',
          hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.tune, color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(
            label: const Text('Semua Jurusan'),
            backgroundColor: AppColors.primaryBlue,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.transparent),
            ),
          ),
          const SizedBox(width: 8),
          Chip(
            avatar: const Icon(
              Icons.circle,
              color: AppColors.primaryBlue,
              size: 10,
            ),
            label: const Text('RPL (Web & Database)'),
            backgroundColor: Colors.white,
            labelStyle: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: AppColors.borderLight),
            ),
          ),
          const SizedBox(width: 8),
          Chip(
            avatar: const Icon(
              Icons.circle,
              color: AppColors.warningOrange,
              size: 10,
            ),
            label: const Text('TKJ (Network & SysAdmin)'),
            backgroundColor: Colors.white,
            labelStyle: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: AppColors.borderLight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildSegmentItem('Semua', true)),
          Expanded(child: _buildSegmentItem('Level 1', false)),
          Expanded(child: _buildSegmentItem('Level 2', false)),
          Expanded(child: _buildSegmentItem('Kasus UKK', false)),
        ],
      ),
    );
  }

  Widget _buildSegmentItem(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
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

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Daftar Paket UKK',
              style: AppTextStyles.headline3.copyWith(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '4 Paket',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        Text(
          'BNSP 2026 Ready',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildPackageCard(
    String title,
    String desc,
    String badge1,
    String badge2,
    bool isOffline,
    String soal,
    String waktu,
    String? rerata,
    String footerLeft,
    bool isDownload,
    bool isBaru,
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
              _buildSmallBadge(
                badge1,
                AppColors.primaryBlue.withValues(alpha: 0.1),
                AppColors.primaryBlue,
              ),
              const SizedBox(width: 8),
              _buildSmallBadge(
                badge2,
                AppColors.warningOrange.withValues(alpha: 0.1),
                AppColors.warningOrange,
              ),
              if (isOffline) ...[
                const SizedBox(width: 8),
                _buildSmallBadge(
                  'Offline',
                  AppColors.successGreenBg,
                  AppColors.successGreenText,
                  icon: Icons.check,
                ),
              ],
              if (!isOffline && !isBaru) ...[
                const SizedBox(width: 8),
                _buildSmallBadge(
                  '2.4 MB',
                  AppColors.backgroundLight,
                  AppColors.textSecondary,
                  icon: Icons.cloud_outlined,
                ),
              ],
              const Spacer(),
              const Icon(
                Icons.bookmark_border,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
          if (isBaru) ...[
            const SizedBox(height: 8),
            _buildSmallBadge(
              'Baru Ditambahkan',
              AppColors.primaryGreen,
              Colors.white,
              filled: true,
            ),
          ],
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.headline3.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            desc,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          if (isBaru) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.school,
                    color: AppColors.primaryBlue,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Dibuat oleh: Pak Budi Santoso, S.T.',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatInfo('Butir Soal', soal),
                _buildStatInfo('Estimasi', waktu),
                if (rerata != null)
                  _buildStatInfo('Rerata Nilai', rerata, isGreen: true)
                else
                  _buildStatInfo(
                    isBaru ? 'Tingkat UKK' : 'Status Akses',
                    isBaru ? 'Praktik' : 'Cloud',
                    isOrange: isBaru,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isDownload
                        ? Icons.info_outline
                        : (isBaru
                              ? Icons.bolt
                              : (isOffline
                                    ? Icons.check_circle_outline
                                    : Icons.access_time)),
                    color: isBaru
                        ? AppColors.primaryGreen
                        : AppColors.textSecondary,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    footerLeft,
                    style: AppTextStyles.caption.copyWith(
                      color: isBaru
                          ? AppColors.primaryGreen
                          : AppColors.textSecondary,
                      fontWeight: isBaru ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              if (isDownload)
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue.withValues(
                      alpha: 0.1,
                    ),
                    foregroundColor: AppColors.primaryBlue,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.download, size: 16),
                  label: const Text(
                    'Unduh Paket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Mulai Kerjakan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallBadge(
    String text,
    Color bgColor,
    Color textColor, {
    IconData? icon,
    bool filled = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: filled ? textColor : bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: filled ? Colors.white : textColor, size: 12),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: filled ? Colors.white : textColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatInfo(
    String label,
    String value, {
    bool isGreen = false,
    bool isOrange = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.headline3.copyWith(
            fontSize: 14,
            color: isGreen
                ? AppColors.primaryGreen
                : (isOrange ? AppColors.warningOrange : AppColors.textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildTipsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.lightbulb_outline, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips UKK Harian',
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kerjakan simulasi waktu nyata agar terbiasa mengelola 90 menit saat asesmen BNSP!',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

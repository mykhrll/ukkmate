import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/latihan/latihan_soal_screen.dart';

class LatihanMandiriScreen extends StatefulWidget {
  const LatihanMandiriScreen({super.key});

  @override
  State<LatihanMandiriScreen> createState() => _LatihanMandiriScreenState();
}

class _LatihanMandiriScreenState extends State<LatihanMandiriScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Semua Elemen',
    'Pemrograman Web',
    'Basis Data & SQL',
    'Jaringan Komputer',
    'Pemrograman Objek (OOP)',
  ];

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
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildHeroProgressCard(context),
              const SizedBox(height: 24),
              _buildPracticeModes(context),
              const SizedBox(height: 24),
              _buildCategoryChips(),
              const SizedBox(height: 24),
              _buildPackageListHeader(),
              const SizedBox(height: 16),
              ..._buildFilteredPackages(context),
              const SizedBox(height: 24),
              _buildStudyTipsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/logo.jpeg',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
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
                Text('Latihan Mandiri', style: AppTextStyles.headline3),
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

  Widget _buildHeroProgressCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'TARGET HARIAN SISWA',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.warningOrange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '+150 Pts',
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Tingkatkan Jam Terbang Soal UKK',
            style: AppTextStyles.headline3.copyWith(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Latih logika penalaran dan pemahaman konsep secara mandiri sebelum simulasi CBT resmi.',
            style: AppTextStyles.bodyText2.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  '14 / 20 Soal',
                  'Progres Hari Ini',
                  Icons.check_circle_outline,
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: Colors.white.withValues(alpha: 0.2),
              ),
              Expanded(
                child: _buildMetricItem(
                  '85% Akurat',
                  'Tingkat Ketepatan',
                  Icons.trending_up,
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: Colors.white.withValues(alpha: 0.2),
              ),
              Expanded(
                child: _buildMetricItem(
                  '4 Paket',
                  'Telah Diselesaikan',
                  Icons.task_alt,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LatihanSoalScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryBlue,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.play_circle_outline, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Lanjutkan Sesi Latihan Terakhir',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Text(
              value,
              style: AppTextStyles.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPracticeModes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mode Latihan Mandiri', style: AppTextStyles.headline3),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildModeCard(
                title: 'Drill Kilat',
                subtitle: '10 Soal Acak',
                icon: Icons.flash_on,
                color: AppColors.warningOrange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LatihanSoalScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildModeCard(
                title: 'Studi Kasus',
                subtitle: 'Pembahasan Lengkap',
                icon: Icons.menu_book,
                color: AppColors.primaryGreen,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LatihanSoalScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildModeCard(
                title: 'Uji Waktu',
                subtitle: 'Real CBT Timer',
                icon: Icons.timer_outlined,
                color: Colors.purple,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LatihanSoalScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: AppTextStyles.caption.copyWith(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return ChoiceChip(
            label: Text(_categories[index]),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              }
            },
            selectedColor: AppColors.primaryBlue,
            backgroundColor: Colors.white,
            labelStyle: AppTextStyles.caption.copyWith(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? AppColors.primaryBlue : AppColors.borderLight,
              ),
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }

  Widget _buildPackageListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Paket Soal Latihan Mandiri', style: AppTextStyles.headline3),
            const SizedBox(height: 2),
            Text(
              'Standar Asesmen Kejuruan BNSP / LSP-P1 SMK',
              style: AppTextStyles.caption,
            ),
          ],
        ),
        Text(
          '5 Tersedia',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFilteredPackages(BuildContext context) {
    final List<Map<String, dynamic>> allPackages = [
      {
        'title': 'Studi Kasus 1: Query SQL & Normalisasi Basis Data',
        'desc': 'Latihan relasi tabel 1NF-3NF, indexing query, inner/left join, dan subquery kompleks pada sistem informasi sekolah.',
        'tag': 'RPL',
        'level': 'Kasus UKK (Mahir)',
        'category': 'Basis Data & SQL',
        'questions': '25 Soal',
        'duration': '45 Menit',
        'score': '88%',
        'isCompleted': true,
      },
      {
        'title': 'Studi Kasus 2: Backend RESTful API & Endpoint JWT',
        'desc': 'Pembuatan arsitektur endpoint MVC, middleware otentikasi JWT token, status kode HTTP, dan pengujian via Postman.',
        'tag': 'RPL',
        'level': 'Level 2 (Menengah)',
        'category': 'Pemrograman Web',
        'questions': '30 Soal',
        'duration': '50 Menit',
        'score': '82%',
        'isCompleted': true,
      },
      {
        'title': 'Studi Kasus 3: Topologi VLAN Trunking & Routing OSPF',
        'desc': 'Konfigurasi VLAN ID 802.1Q pada switch manageable, inter-VLAN routing, dan kalkulasi subnet VLSM.',
        'tag': 'TKJ',
        'level': 'Kasus UKK (Mahir)',
        'category': 'Jaringan Komputer',
        'questions': '25 Soal',
        'duration': '40 Menit',
        'score': null,
        'isCompleted': false,
      },
      {
        'title': 'Studi Kasus 4: Paradigma Object-Oriented Programming (OOP)',
        'desc': 'Implementasi konsep Encapsulation, Inheritance, Polymorphism, dan Abstraction pada arsitektur perangkat lunak.',
        'tag': 'RPL',
        'level': 'Level 1 (Dasar)',
        'category': 'Pemrograman Objek (OOP)',
        'questions': '20 Soal',
        'duration': '35 Menit',
        'score': '90%',
        'isCompleted': true,
      },
      {
        'title': 'Studi Kasus 5: Keamanan Jaringan & Firewall MikroTik',
        'desc': 'Penyusunan filter rules forward/input, pencegahan serangan brute-force SSH/Winbox, dan konfigurasi NAT Masquerade.',
        'tag': 'TKJ',
        'level': 'Level 2 (Menengah)',
        'category': 'Jaringan Komputer',
        'questions': '20 Soal',
        'duration': '30 Menit',
        'score': null,
        'isCompleted': false,
      },
    ];

    final filtered = _selectedCategoryIndex == 0
        ? allPackages
        : allPackages.where((p) => p['category'] == _categories[_selectedCategoryIndex]).toList();

    if (filtered.isEmpty) {
      return [
        Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            children: [
              const Icon(Icons.inbox_outlined, size: 40, color: AppColors.textSecondary),
              const SizedBox(height: 8),
              Text('Belum ada paket pada elemen ini', style: AppTextStyles.bodyText2),
              const SizedBox(height: 4),
              Text('Pilih kategori lain untuk mulai latihan', style: AppTextStyles.caption),
            ],
          ),
        ),
      ];
    }

    return filtered.map((pkg) => _buildPackageCard(context, pkg)).toList();
  }

  Widget _buildPackageCard(BuildContext context, Map<String, dynamic> pkg) {
    final bool isCompleted = pkg['isCompleted'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      pkg['tag'],
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.warningOrange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      pkg['level'],
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warningOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              if (isCompleted && pkg['score'] != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.successGreenBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, size: 12, color: AppColors.successGreenText),
                      const SizedBox(width: 4),
                      Text(
                        'Skor: ${pkg['score']}',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.successGreenText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            pkg['title'],
            style: AppTextStyles.headline3.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 6),
          Text(
            pkg['desc'],
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.help_outline, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(pkg['questions'], style: AppTextStyles.caption),
                  const SizedBox(width: 12),
                  const Icon(Icons.timer_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(pkg['duration'], style: AppTextStyles.caption),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LatihanSoalScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCompleted ? AppColors.backgroundDark : AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  isCompleted ? 'Ulangi Latihan' : 'Mulai Latihan',
                  style: AppTextStyles.buttonText.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStudyTipsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.lightbulb_outline, color: AppColors.primaryBlue, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips Sukses Latihan Mandiri',
                  style: AppTextStyles.headline3.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'Kerjakan latihan secara berkala minimal 1 paket per hari. Cermati analisis pembahasan di setiap akhir soal agar pemahaman konsep semakin matang.',
                  style: AppTextStyles.bodyText2.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
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

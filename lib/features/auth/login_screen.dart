import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/guru/guru_navigation.dart';
import 'package:ukkmate/features/navigation/main_navigation.dart';

class LoginScreen extends StatefulWidget {
  final bool initialIsLogin;
  const LoginScreen({super.key, this.initialIsLogin = true});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _isLogin;
  bool _obscureLoginPassword = true;
  bool _obscureRegisterPassword = true;
  bool _agreeTerms = false;

  final TextEditingController _nisnController = TextEditingController();
  final TextEditingController _loginIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isLogin = widget.initialIsLogin;
  }

  @override
  void dispose() {
    _nisnController.dispose();
    _loginIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildTabBar(),
              const SizedBox(height: 24),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                crossFadeState: _isLogin
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: _buildLoginContent(),
                secondChild: _buildRegisterContent(),
              ),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/logo.jpeg',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('UKKMate', style: AppTextStyles.headline3),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'SMK',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text('SMK BISA HEBAT', style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.successGreenBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primaryGreen.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Dapodik API Terhubung',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.successGreenText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = (constraints.maxWidth - 8) / 2;
          return Stack(
            children: [
              // Smooth sliding blue indicator pill
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutCubic,
                left: _isLogin ? 4 : tabWidth + 4,
                top: 4,
                bottom: 4,
                width: tabWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.25),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              // Tab buttons
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (!_isLogin) {
                          setState(() {
                            _isLogin = true;
                          });
                        }
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppTextStyles.buttonText.copyWith(
                            color: _isLogin ? Colors.white : AppColors.textSecondary,
                            fontWeight: _isLogin ? FontWeight.bold : FontWeight.w600,
                            fontSize: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login,
                                color: _isLogin ? Colors.white : AppColors.textSecondary,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              const Text('Masuk Akun'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (_isLogin) {
                          setState(() {
                            _isLogin = false;
                          });
                        }
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppTextStyles.buttonText.copyWith(
                            color: !_isLogin ? Colors.white : AppColors.textSecondary,
                            fontWeight: !_isLogin ? FontWeight.bold : FontWeight.w600,
                            fontSize: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_add_alt_1_outlined,
                                color: !_isLogin ? Colors.white : AppColors.textSecondary,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              const Text('Daftar Akun Baru'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // ===================== LOGIN VIEW =====================
  Widget _buildLoginContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Portal Masuk UKKMate', style: AppTextStyles.headline1),
        const SizedBox(height: 8),
        Text(
          'Satu pintu akses terpadu bagi Siswa Uji Kompetensi Keahlian & Guru Pendamping SMK',
          style: AppTextStyles.bodyText1.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        _buildLoginInfoCard(),
        const SizedBox(height: 24),
        _buildLoginForm(),
        const SizedBox(height: 28),
        _buildLoginFooter(),
      ],
    );
  }

  Widget _buildLoginInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.primaryBlue,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PANDUAN IDENTITAS MASUK',
                    style: AppTextStyles.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: AppColors.primaryGreen,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Deteksi Otomatis',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            icon: Icons.school_outlined,
            iconColor: AppColors.primaryBlue,
            iconBgColor: AppColors.primaryBlue.withValues(alpha: 0.1),
            title: 'Siswa SMK (10 Digit NISN)',
            desc:
                'Otomatis membuka simulasi CBT, bank soal kejuruan sesuai data sekolah, dan latihan mandiri UKK.',
          ),
          const SizedBox(height: 12),
          _buildInfoItem(
            icon: Icons.assignment_ind_outlined,
            iconColor: AppColors.primaryGreen,
            iconBgColor: AppColors.primaryGreen.withValues(alpha: 0.1),
            title: 'Guru Pendamping (18 Digit NIP)',
            desc:
                'Masuk untuk verifikasi peserta, pemantauan nilai ujian siswa, rombel binaan, dan penilaian lab.',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(desc, style: AppTextStyles.bodyText2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.badge_outlined,
              color: AppColors.textPrimary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Nomor Induk Identitas (NISN / NIP)',
              style: AppTextStyles.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.successGreenBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.successGreenText,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Deteksi Peran Otomatis',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.successGreenText,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _loginIdController,
          decoration: InputDecoration(
            hintText: 'Contoh: 0068492019 (Siswa) atau 19780512... (Guru)',
            hintStyle: AppTextStyles.bodyText1.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            prefixIcon: const Icon(Icons.pin_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primaryBlue),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.vpn_key_outlined,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Kata Sandi / Token CBT',
                  style: AppTextStyles.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'Lupa Kata Sandi?',
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: _obscureLoginPassword,
          decoration: InputDecoration(
            hintText: 'Masukkan kata sandi atau token ujian',
            hintStyle: AppTextStyles.bodyText1.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureLoginPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () {
                setState(() {
                  _obscureLoginPassword = !_obscureLoginPassword;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primaryBlue),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigation(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Masuk ke UKKMate', style: AppTextStyles.buttonText),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum terdaftar di sistem UKKMate? ',
              style: AppTextStyles.bodyText2,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLogin = false;
                });
              },
              child: Text(
                'Daftar Akun Baru',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                            builder: (_) => const GuruNavigation(initialIndex: 2),
                ),
              );
            },
            icon: const Icon(
              Icons.verified_user_outlined,
              color: AppColors.primaryGreen,
              size: 18,
            ),
            label: Text(
              'Masuk sebagai Guru Pendamping (NIP Terverifikasi)',
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.successGreenText,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.successGreenBg.withValues(alpha: 0.5),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'PUSDATIN KEMENDIKBUDRISTEK',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text('•', style: TextStyle(color: AppColors.borderLight)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'BNSP LSP-P1',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Standar Uji Kompetensi Keahlian SMK Nasional Terintegrasi &\nTerverifikasi',
          textAlign: TextAlign.center,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ===================== REGISTER VIEW =====================
  Widget _buildRegisterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Daftar Akun Siswa Baru', style: AppTextStyles.headline1),
        const SizedBox(height: 8),
        Text(
          'Pendaftaran akun mandiri peserta uji sertifikasi kompetensi keahlian SMK',
          style: AppTextStyles.bodyText1.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        _buildRegisterSyncCard(),
        const SizedBox(height: 24),
        _buildRegisterForm(),
        const SizedBox(height: 28),
        _buildRegisterFooter(),
      ],
    );
  }

  Widget _buildRegisterSyncCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sinkronisasi Otomatis NISN',
                  style: AppTextStyles.subtitle1.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Dapodik Terintegrasi',
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Cukup masukkan 10 digit NISN resmi Anda. Nama lengkap, sekolah induk, dan kompetensi keahlian (RPL/TKJ) akan otomatis terverifikasi tanpa perlu input manual yang berulang.',
                  style: AppTextStyles.bodyText2.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nomor Induk Siswa Nasional (NISN) *',
                style: AppTextStyles.subtitle2,
              ),
              Text(
                '${_nisnController.text.length}/10 digit',
                style: AppTextStyles.bodyText2.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nisnController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  onChanged: (val) => setState(() {}),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Contoh: 0064829102',
                    hintStyle: AppTextStyles.bodyText1.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                    prefixIcon: const Icon(Icons.badge_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.borderLight),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.borderLight),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('NISN berhasil divalidasi dengan Dapodik Kemendikbudristek!'),
                      backgroundColor: AppColors.primaryGreen,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 18,
                ),
                label: Text(
                  'Cek Validasi',
                  style: AppTextStyles.buttonText.copyWith(fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Pastikan 10 digit NISN terdaftar aktif di Dapodik Kemendikbudristek.',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nama Lengkap Siswa', style: AppTextStyles.subtitle2),
              Row(
                children: [
                  const Icon(Icons.bolt, color: AppColors.primaryGreen, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Sesuai Dapodik / Ijazah',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: 'Muhamad Zidan (Otomatis dari Dapodik)',
              hintStyle: AppTextStyles.bodyText1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              prefixIcon: const Icon(Icons.person_outline),
              filled: true,
              fillColor: AppColors.backgroundLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kompetensi Keahlian', style: AppTextStyles.subtitle2),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.sync, color: AppColors.primaryGreen, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Otomatis via Dapodik',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'RPL',
                      style: AppTextStyles.subtitle1.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Rekayasa Perangkat Lunak',
                              style: AppTextStyles.subtitle2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Terverifikasi',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primaryGreen,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Program Keahlian SMK 3 Tahun Sesuai Dapodik',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.verified, color: AppColors.primaryGreen, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jenis Kelamin & Avatar', style: AppTextStyles.subtitle2),
              Row(
                children: [
                  const Icon(Icons.sync, color: AppColors.primaryGreen, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Otomatis via Dapodik',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/pp_default_laki-laki.jpg',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Laki-laki', style: AppTextStyles.subtitle2),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.borderLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Avatar Default Terassign',
                              style: AppTextStyles.caption.copyWith(fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Data identitas jenis kelamin disinkronkan langsung dari NISN Dapodik',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryGreen,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Text('Email Aktif Siswa *', style: AppTextStyles.subtitle2),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'nama.siswa@smk.belajar.id atau email pribadi',
              hintStyle: AppTextStyles.bodyText1.copyWith(
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Digunakan untuk konfirmasi token asesmen dan sertifikat digital UKK.',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 20),

          Text('Kata Sandi Baru *', style: AppTextStyles.subtitle2),
          const SizedBox(height: 8),
          TextField(
            obscureText: _obscureRegisterPassword,
            decoration: InputDecoration(
              hintText: 'Minimal 8 karakter kombinasi',
              hintStyle: AppTextStyles.bodyText1.copyWith(
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureRegisterPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureRegisterPassword = !_obscureRegisterPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeTerms = value ?? false;
                    });
                  },
                  activeColor: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Saya menyetujui kepatuhan etika uji sertifikasi kompetensi kejuruan BNSP / LSP-P1 SMK serta mengizinkan integrasi verifikasi data Dapodik Kemendikbudristek.',
                  style: AppTextStyles.caption.copyWith(height: 1.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainNavigation()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Daftar Sekarang sebagai Siswa',
                    style: AppTextStyles.buttonText,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterFooter() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.assignment_ind_outlined,
                  color: AppColors.primaryBlue,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anda Guru Pendamping?',
                      style: AppTextStyles.subtitle2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Guru terdaftar resmi dengan NIP melalui Dapodik sekolah, tidak perlu mendaftar manual.',
                      style: AppTextStyles.caption,
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                                      builder: (_) => const GuruNavigation(initialIndex: 2),
                          ),
                        );
                      },
                      child: Text(
                        'Masuk dengan NIP di sini →',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sudah memiliki akun? ', style: AppTextStyles.bodyText2),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLogin = true;
                });
              },
              child: Text(
                'Masuk Sekarang',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user_outlined,
              color: AppColors.primaryGreen,
              size: 14,
            ),
            const SizedBox(width: 4),
            Text(
              'Sertifikasi Protokol Keamanan SSL 256-bit Terenkripsi',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ],
    );
  }
}

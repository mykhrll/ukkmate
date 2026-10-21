import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

class LatihanSoalScreen extends StatefulWidget {
  const LatihanSoalScreen({super.key});

  @override
  State<LatihanSoalScreen> createState() => _LatihanSoalScreenState();
}

class _LatihanSoalScreenState extends State<LatihanSoalScreen> {
  int _selectedAnswer = 0; // 0 = A selected
  bool _showAnswer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Latihan Mandiri RPL', style: AppTextStyles.subtitle1.copyWith(color: Colors.white, fontSize: 14)),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.primaryGreen, size: 6),
                const SizedBox(width: 4),
                Text('Paket Simulasi Teori Kejuruan', style: AppTextStyles.caption.copyWith(color: Colors.white70, fontSize: 10)),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white, size: 16),
                const SizedBox(width: 6),
                Text('14:52', style: AppTextStyles.subtitle2.copyWith(color: Colors.white, fontFamily: 'monospace')),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopicBar(),
                  _buildProgressBar(),
                  _buildQuestionInfo(),
                  _buildQuestionText(),
                  _buildDiagramImage(),
                  _buildAnswerOptions(),
                  if (_showAnswer) _buildAnswerExplanation(),
                ],
              ),
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildTopicBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.computer, color: AppColors.primaryBlue, size: 14),
                const SizedBox(width: 6),
                Text('Pemrograman Web', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.primaryBlue, size: 16),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.warningOrange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.signal_cellular_alt, color: AppColors.warningOrange, size: 14),
                const SizedBox(width: 4),
                Text('Tingkat Menengah', style: AppTextStyles.caption.copyWith(color: AppColors.warningOrange, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('3/25', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 3 / 25,
              backgroundColor: Color(0xFFE5E7EB),
              color: AppColors.primaryBlue,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pertanyaan #3 dari 25 (ID:\n1056)', style: AppTextStyles.caption.copyWith(fontSize: 10, fontFamily: 'monospace', height: 1.3)),
            Text('Bobot 4\nPoin', style: AppTextStyles.caption.copyWith(fontSize: 10, fontWeight: FontWeight.bold, height: 1.3)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionText() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.bodyText1.copyWith(fontSize: 15, height: 1.6),
          children: [
            const TextSpan(text: 'Dalam implementasi model pembelajaran dan arsitektur aplikasi UKKMate, sebutkan prinsip utama dari arsitektur '),
            TextSpan(
              text: 'Offline-First',
              style: AppTextStyles.bodyText1.copyWith(fontSize: 15, fontFamily: 'monospace', fontWeight: FontWeight.bold, backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.08)),
            ),
            const TextSpan(text: ' pada aplikasi mobile client?'),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagramImage() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.schema, color: AppColors.textSecondary.withValues(alpha: 0.5), size: 36),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search, color: AppColors.textSecondary, size: 12),
                  const SizedBox(width: 4),
                  Text('Diagram Sinkronisasi UKKMate Client-\nStorage', style: AppTextStyles.caption.copyWith(fontSize: 10, height: 1.3)),
                  const SizedBox(width: 16),
                  Text('FIG.\n4.1', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 10, height: 1.3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildAnswerItem('A', 'Mengutamakan penyimpanan lokal (SQLite/IndexedDB) dan sinkronisasi berkala ke server', _selectedAnswer == 0, true),
          const SizedBox(height: 10),
          _buildAnswerItem('B', 'Mengharuskan koneksi internet aktif setiap kali membuka soal', _selectedAnswer == 1, false),
          const SizedBox(height: 10),
          _buildAnswerItem('C', 'Menyimpan cache sementara hanya pada memori RAM', _selectedAnswer == 2, false),
          const SizedBox(height: 10),
          _buildAnswerItem('D', 'Mengandalkan webview tanpa integrasi database perangkat', _selectedAnswer == 3, false),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnswerItem(String letter, String text, bool isSelected, bool isCorrect) {
    Color borderColor;
    Color bgColor;
    Color letterBg;
    Color letterColor;

    if (isSelected && isCorrect) {
      borderColor = AppColors.primaryGreen;
      bgColor = AppColors.primaryGreen.withValues(alpha: 0.05);
      letterBg = AppColors.primaryGreen;
      letterColor = Colors.white;
    } else if (isSelected) {
      borderColor = AppColors.primaryBlue;
      bgColor = AppColors.primaryBlue.withValues(alpha: 0.05);
      letterBg = AppColors.primaryBlue;
      letterColor = Colors.white;
    } else {
      borderColor = AppColors.borderLight;
      bgColor = Colors.white;
      letterBg = AppColors.backgroundLight;
      letterColor = AppColors.textSecondary;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnswer = letter.codeUnitAt(0) - 'A'.codeUnitAt(0);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: letterBg,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(letter, style: AppTextStyles.subtitle2.copyWith(color: letterColor, fontSize: 13)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: AppTextStyles.bodyText1.copyWith(fontSize: 13, height: 1.4)),
                  if (isSelected && isCorrect) ...[
                    const SizedBox(height: 6),
                    const Icon(Icons.check_circle, color: AppColors.primaryGreen, size: 18),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerExplanation() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryGreen.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Jawaban Anda Benar!', style: AppTextStyles.subtitle2.copyWith(color: AppColors.primaryGreen)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDark,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('KUNCI: A', style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'monospace', fontSize: 10)),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showAnswer = !_showAnswer;
                    });
                  },
                  child: Text(_showAnswer ? 'Detail ▴' : 'Detail ▾', style: AppTextStyles.caption.copyWith(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            if (_showAnswer) ...[
              const SizedBox(height: 12),
              Text(
                'Arsitektur Offline-First dirancang agar peserta didik SMK dapat mengerjakan latihan soal kapanpun tanpa ketergantungan sinyal internet, menyimpan state ujian ke database lokal dan melakukan sinkronisasi otomatis saat online.',
                style: AppTextStyles.bodyText2.copyWith(color: AppColors.textPrimary, fontSize: 12, height: 1.5),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb, color: AppColors.warningOrange, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tip Kompetensi UKK:', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary, fontSize: 11)),
                          const SizedBox(height: 2),
                          Text(
                            'Gunakan IndexedDB atau WatermelonDB untuk sinkronisasi antrean (queue) batch saat aplikasi mendeteksi event window.navigator.onLine.',
                            style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 10, fontFamily: 'monospace', height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: AppColors.borderLight, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quick navigation
          Row(
            children: [
              Text('Navigasi\nCepat', style: AppTextStyles.caption.copyWith(fontSize: 10, height: 1.2)),
              const SizedBox(width: 12),
              _buildNavDot('1', false),
              const SizedBox(width: 4),
              _buildNavDot('2', false),
              const SizedBox(width: 4),
              _buildNavDot('3', true),
              const SizedBox(width: 4),
              _buildNavDot('4', false),
              const SizedBox(width: 4),
              _buildNavDot('5', false),
              const SizedBox(width: 4),
              _buildNavDot('6', false),
              const SizedBox(width: 4),
              Text('...', style: AppTextStyles.caption),
              const SizedBox(width: 4),
              _buildNavDot('25', false),
            ],
          ),
          const SizedBox(height: 12),
          // Previous / Next buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: AppColors.borderLight),
                  ),
                  icon: const Icon(Icons.chevron_left, size: 18),
                  label: const Text('Sebelumnya', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Selanjutnya', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(width: 4),
                      Icon(Icons.chevron_right, size: 18),
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

  Widget _buildNavDot(String number, bool isActive) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryBlue : AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: isActive ? AppColors.primaryBlue : AppColors.borderLight),
      ),
      alignment: Alignment.center,
      child: Text(
        number,
        style: AppTextStyles.caption.copyWith(
          color: isActive ? Colors.white : AppColors.textSecondary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 10,
        ),
      ),
    );
  }
}

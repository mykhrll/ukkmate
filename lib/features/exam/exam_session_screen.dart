import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';
import 'package:ukkmate/features/exam/exam_result_screen.dart';

class ExamSessionScreen extends StatefulWidget {
  const ExamSessionScreen({super.key});

  @override
  State<ExamSessionScreen> createState() => _ExamSessionScreenState();
}

class _ExamSessionScreenState extends State<ExamSessionScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedOption;

  final int _totalQuestions = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressIndicator(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildQuestionCard(),
                    const SizedBox(height: 24),
                    _buildOptions(),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textPrimary),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Column(
        children: [
          Text(
            'Simulasi UKK',
            style: AppTextStyles.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.timer_outlined,
                size: 14,
                color: AppColors.warningOrange,
              ),
              const SizedBox(width: 4),
              Text(
                '01:29:45',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.warningOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            _showQuestionGrid();
          },
          child: const Icon(Icons.grid_view, color: AppColors.primaryBlue),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 4,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: (_currentQuestionIndex + 1) / _totalQuestions,
        child: Container(color: AppColors.primaryBlue),
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Soal ${_currentQuestionIndex + 1} / $_totalQuestions',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Dalam rekayasa perangkat lunak, apa yang dimaksud dengan pola desain arsitektur MVC?',
            style: AppTextStyles.bodyText1.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    final List<String> options = [
      'Model, View, Controller',
      'Module, View, Component',
      'Model, Variable, Component',
      'Module, Variable, Controller',
    ];

    return Column(
      children: List.generate(options.length, (index) {
        final isSelected = _selectedOption == index;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryBlue.withValues(alpha: 0.05) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primaryBlue : AppColors.borderLight,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
                        width: isSelected ? 6 : 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      options[index],
                      style: AppTextStyles.bodyText2.copyWith(
                        color: isSelected ? AppColors.primaryBlue : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavigation() {
    final isLastQuestion = _currentQuestionIndex == _totalQuestions - 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: _currentQuestionIndex > 0
                ? () {
                    setState(() {
                      _currentQuestionIndex--;
                      _selectedOption = null;
                    });
                  }
                : null,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Sebelumnya'),
          ),
          ElevatedButton(
            onPressed: () {
              if (isLastQuestion) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExamResultScreen(),
                  ),
                );
              } else {
                setState(() {
                  _currentQuestionIndex++;
                  _selectedOption = null;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isLastQuestion ? AppColors.successGreenBg : AppColors.primaryBlue,
              foregroundColor: isLastQuestion ? AppColors.successGreenText : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(isLastQuestion ? 'Selesai Ujian' : 'Selanjutnya'),
          ),
        ],
      ),
    );
  }

  void _showQuestionGrid() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Daftar Soal', style: AppTextStyles.headline3),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: _totalQuestions,
                  itemBuilder: (context, index) {
                    final isCurrent = index == _currentQuestionIndex;
                    final isAnswered = index < _currentQuestionIndex; 
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentQuestionIndex = index;
                          _selectedOption = null;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? AppColors.primaryBlue
                              : (isAnswered ? AppColors.successGreenBg : Colors.white),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isCurrent
                                ? AppColors.primaryBlue
                                : (isAnswered ? AppColors.primaryGreen : AppColors.borderLight),
                          ),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: AppTextStyles.bodyText2.copyWith(
                            color: isCurrent
                                ? Colors.white
                                : (isAnswered ? AppColors.successGreenText : AppColors.textPrimary),
                            fontWeight: isCurrent || isAnswered ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

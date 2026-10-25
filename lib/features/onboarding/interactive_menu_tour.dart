import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

/// Model representing a single step in the interactive menu guide.
class TourStep {
  final String title;
  final String badgeText;
  final String description;
  final IconData icon;
  final Color color;
  final int? tabIndex;
  final bool isFab;

  const TourStep({
    required this.title,
    required this.badgeText,
    required this.description,
    required this.icon,
    this.color = AppColors.primaryBlue,
    this.tabIndex,
    this.isFab = false,
  });
}

/// Overlay that renders a focused popup card with an arrow pointing to the target menu.
class InteractiveTourOverlay extends StatelessWidget {
  final List<TourStep> steps;
  final int currentStep;
  final int totalTabs;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;
  final VoidCallback onFinish;

  const InteractiveTourOverlay({
    super.key,
    required this.steps,
    required this.currentStep,
    this.totalTabs = 4,
    required this.onNext,
    required this.onPrevious,
    required this.onSkip,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    if (currentStep < 0 || currentStep >= steps.length) {
      return const SizedBox.shrink();
    }

    final step = steps[currentStep];
    final isLastStep = currentStep == steps.length - 1;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final bottomInset = mediaQuery.padding.bottom;

    // Calculate pointer horizontal offset relative to the screen
    double screenArrowX;
    if (step.isFab) {
      // FAB is on bottom right
      screenArrowX = screenWidth - 44;
    } else if (step.tabIndex != null && totalTabs > 0) {
      screenArrowX = (step.tabIndex! + 0.5) * (screenWidth / totalTabs);
    } else {
      screenArrowX = screenWidth / 2;
    }

    // Local arrow X inside the Positioned (which has left: 16, right: 16)
    final localArrowX = (screenArrowX - 16).clamp(20.0, screenWidth - 52.0);

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // Semi-transparent dark backdrop
          GestureDetector(
            onTap: onSkip,
            behavior: HitTestBehavior.opaque,
            child: Container(
              color: Colors.black.withValues(alpha: 0.65),
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Floating guide popup positioned above bottom nav
          Positioned(
            left: 16,
            right: 16,
            bottom: 72 + bottomInset,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Main Popup Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: step.color.withValues(alpha: 0.25),
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header: Badge + Close button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: step.color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              step.badgeText,
                              style: AppTextStyles.caption.copyWith(
                                color: step.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: onSkip,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Content: Icon + Title & Short Explanation
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: step.color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(step.icon, color: step.color, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step.title,
                                  style: AppTextStyles.headline3.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  step.description,
                                  style: AppTextStyles.bodyText2.copyWith(
                                    fontSize: 13,
                                    height: 1.35,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Footer: Step Dots + Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Dots indicator
                          Row(
                            children: List.generate(
                              steps.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.only(right: 6),
                                width: index == currentStep ? 20 : 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: index == currentStep
                                      ? step.color
                                      : Colors.grey.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),

                          // Action Buttons
                          Row(
                            children: [
                              if (currentStep > 0)
                                TextButton(
                                  onPressed: onPrevious,
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Kembali',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              if (currentStep > 0) const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: isLastStep ? onFinish : onNext,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isLastStep ? AppColors.primaryGreen : step.color,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      isLastStep ? 'Mulai Jelajahi' : 'Lanjut',
                                      style: AppTextStyles.buttonText.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      isLastStep ? Icons.check : Icons.arrow_forward_ios,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Downward Pointer Triangle pointing towards menu icon
                SizedBox(
                  height: 10,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: _ArrowPainter(
                      arrowX: localArrowX,
                      color: Colors.white,
                      borderColor: step.color.withValues(alpha: 0.25),
                    ),
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

class _ArrowPainter extends CustomPainter {
  final double arrowX;
  final Color color;
  final Color borderColor;

  _ArrowPainter({
    required this.arrowX,
    required this.color,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double arrowWidth = 18;
    const double arrowHeight = 10;
    final double left = arrowX - (arrowWidth / 2);
    final double right = arrowX + (arrowWidth / 2);

    final path = Path()
      ..moveTo(left, 0)
      ..lineTo(right, 0)
      ..lineTo(arrowX, arrowHeight)
      ..close();

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final borderPath = Path()
      ..moveTo(left, 0)
      ..lineTo(arrowX, arrowHeight)
      ..lineTo(right, 0);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) {
    return oldDelegate.arrowX != arrowX ||
        oldDelegate.color != color ||
        oldDelegate.borderColor != borderColor;
  }
}

import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/core/theme/app_text_styles.dart';

enum BadgeType { success, warning, error, info, offline, neutral }

class StatusBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final IconData? icon;

  const StatusBadge({
    super.key,
    required this.text,
    this.type = BadgeType.success,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (type) {
      case BadgeType.success:
        bgColor = AppColors.successGreenBg;
        textColor = AppColors.successGreenText;
        break;
      case BadgeType.warning:
        bgColor = AppColors.warningYellow.withValues(alpha: 0.1);
        textColor = AppColors.warningYellow;
        break;
      case BadgeType.error:
        bgColor = AppColors.errorRed.withValues(alpha: 0.1);
        textColor = AppColors.errorRed;
        break;
      case BadgeType.info:
        bgColor = AppColors.infoBlueBg;
        textColor = AppColors.infoBlueText;
        break;
      case BadgeType.offline:
        bgColor = AppColors.offlineOrange.withValues(alpha: 0.1);
        textColor = AppColors.offlineOrange;
        break;
      case BadgeType.neutral:
        bgColor = AppColors.borderLight;
        textColor = AppColors.textPrimary;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

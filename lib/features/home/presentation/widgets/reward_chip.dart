import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class RewardChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const RewardChip({
    super.key,
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppResponsive.paddingSymmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppResponsive.radius(20)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: AppResponsive.iconSizeSmall),
          AppResponsive.horizontalSpace4,
          Text(
            value,
            style: AppResponsive.textStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: AppResponsive.fontSizeXSmall
            ),
          ),
        ],
      ),
    );
  }
}

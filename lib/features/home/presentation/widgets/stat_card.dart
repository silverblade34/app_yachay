import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  final String trend;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
         height: AppResponsive.height(85),
        padding: AppResponsive.paddingSmall,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppResponsive.radiusLarge),
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: iconColor, size: AppResponsive.fontSizeSmall),
                Text(
                  trend,
                  style: AppResponsive.textStyle(
                    color: iconColor,
                    fontSize: AppResponsive.fontSizeSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            AppResponsive.verticalSpace4,
            Text(
              value,
              style: AppResponsive.textStyle(
                color: AppColors.textDark,
                fontSize: AppResponsive.fontSizeRegular,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: AppResponsive.textStyle(
                color: AppColors.textDarkSubtitle,
                fontSize: AppResponsive.fontSizeXSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

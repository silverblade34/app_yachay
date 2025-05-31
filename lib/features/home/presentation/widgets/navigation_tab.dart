import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class NavigationTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const NavigationTab({
    super.key,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: AppResponsive.paddingSymmetric(vertical: 9),
        decoration: BoxDecoration(
          gradient: isActive
              ? LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark])
              : null,
          borderRadius: BorderRadius.circular(AppResponsive.radiusRegular),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppResponsive.textStyle(
            color: isActive ? Colors.white : AppColors.textDarkSubtitle,
            fontWeight: FontWeight.bold,
            fontSize: AppResponsive.fontSizeSmall
          ),
        ),
      ),
    );
  }
}
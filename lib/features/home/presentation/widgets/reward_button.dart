import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class RewardButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RewardButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppResponsive.width(25),
        height: AppResponsive.height(25),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppResponsive.radius(18)),
        ),
        child: Icon(
          icon,
          color: AppColors.textDark,
          size: AppResponsive.iconSizeSmall,
        ),
      ),
    );
  }
}

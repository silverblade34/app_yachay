import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class ProfileSetupNavigationButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final double? elevation;
  final MainAxisSize mainAxisSize;
  final bool showIcon;
  final bool iconAtEnd;

  const ProfileSetupNavigationButton({
    super.key,
    required this.text,
    this.icon,
    this.isEnabled = true,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.borderSide,
    this.elevation,
    this.mainAxisSize = MainAxisSize.min,
    this.showIcon = true,
    this.iconAtEnd = false,
  });

  // Factory para botón "Atrás"
  factory ProfileSetupNavigationButton.back({
    required VoidCallback onPressed,
  }) {
    return ProfileSetupNavigationButton(
      text: 'Atrás',
      icon: Icons.arrow_back_rounded,
      onPressed: onPressed,
      backgroundColor: AppColors.backgroundDarkIntense,
      foregroundColor: AppColors.textDark,
      padding: AppResponsive.paddingSymmetric(
        horizontal: 18,
        vertical: 10,
      ),
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        // ignore: deprecated_member_use
        color: AppColors.primary.withOpacity(0.3),
      ),
      iconAtEnd: false,
    );
  }

  // Factory para botón "Siguiente"
  factory ProfileSetupNavigationButton.next({
    required bool canProceed,
    required VoidCallback? onPressed,
  }) {
    return ProfileSetupNavigationButton(
      text: 'Siguiente',
      icon: Icons.arrow_forward_rounded,
      isEnabled: canProceed,
      onPressed: onPressed,
      backgroundColor:
          canProceed ? AppColors.primary : AppColors.textDarkSubtitle,
      foregroundColor: AppColors.textDark,
      padding: AppResponsive.paddingSymmetric(
        horizontal: 20,
        vertical: 10,
      ),
      borderRadius: BorderRadius.circular(30),
      elevation: canProceed ? 8 : 0,
      iconAtEnd: true,
    );
  }

  // Factory para botón final
  factory ProfileSetupNavigationButton.finish({
    required bool canProceed,
    required VoidCallback? onPressed,
  }) {
    return ProfileSetupNavigationButton(
      text: '¡Comenzar mi aventura de aprendizaje!',
      icon: Icons.rocket_launch,
      isEnabled: canProceed,
      onPressed: onPressed,
      backgroundColor:
          canProceed ? AppColors.primary : AppColors.textDarkSubtitle,
      foregroundColor: Colors.white,
      padding: AppResponsive.paddingSymmetric(vertical: 12),
      borderRadius: AppResponsive.borderRadiusLarge,
      elevation: canProceed ? 8 : 0,
      mainAxisSize: MainAxisSize.max,
      iconAtEnd: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? AppResponsive.borderRadiusRegular,
            side: borderSide ?? BorderSide.none,
          ),
          elevation: elevation ?? 0,
        ),
        child: Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildButtonContent(),
        ),
      ),
    );
  }

  List<Widget> _buildButtonContent() {
    final List<Widget> children = [];

    if (showIcon && icon != null && !iconAtEnd) {
      children.add(
        Icon(
          icon,
          color: isEnabled
              ? (foregroundColor ?? Colors.white)
              : AppColors.textDarkSubtitle,
        ),
      );
      children.add(AppResponsive.horizontalSpace8);
    }

    children.add(
      Text(
        text,
        style: AppResponsive.textStyle(
          fontSize: AppResponsive.fontSizeMedium,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    if (showIcon && icon != null && iconAtEnd) {
      children.add(AppResponsive.horizontalSpace8);
      children.add(
        Icon(
          icon,
          color: isEnabled
              ? (foregroundColor ?? Colors.white)
              : AppColors.textDarkSubtitle,
        ),
      );
    }

    return children;
  }
}

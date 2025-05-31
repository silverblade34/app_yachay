import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: AppResponsive.height(145),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(AppResponsive.radiusXLarge),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: AppResponsive.radius(20),
            offset: Offset(0, AppResponsive.height(10)),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppResponsive.radiusXLarge),
          onTap: onTap,
          child: Padding(
            padding: AppResponsive.paddingXRegular,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconContainer(),
                AppResponsive.verticalSpace12,
                _buildTitle(),
                AppResponsive.verticalSpace4,
                _buildSubtitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: AppResponsive.width(48),
      height: AppResponsive.height(48),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppResponsive.radiusLarge),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: AppResponsive.iconSizeRegular,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppResponsive.textStyle(
        color: Colors.white,
        fontSize: AppResponsive.fontSizeRegular,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle,
      style: AppResponsive.textStyle(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.8),
        fontSize: AppResponsive.fontSizeXSmall,
      ),
      textAlign: TextAlign.center,
    );
  }
}

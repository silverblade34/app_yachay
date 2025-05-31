import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppResponsive.paddingXRegular,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppResponsive.radiusLarge),
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconContainer(),
              Text(
                '${category['tests']} pruebas',
                style: AppResponsive.textStyle(
                  color: AppColors.textDarkSubtitle,
                  fontSize: AppResponsive.fontSizeXSmall,
                ),
              ),
            ],
          ),
          AppResponsive.verticalSpace12,
          Text(
            category['name'],
            style: AppResponsive.textStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppResponsive.verticalSpace8,
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: AppResponsive.width(40),
      height: AppResponsive.height(40),
      decoration: BoxDecoration(
        color: category['color'],
        borderRadius: BorderRadius.circular(AppResponsive.radiusRegular),
      ),
      child: Center(
        child: Text(
          category['icon'],
          style: AppResponsive.textStyle(fontSize: AppResponsive.fontSizeXLarge),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: AppResponsive.height(8),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppResponsive.radiusSmall),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: category['progress'],
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
            ),
            borderRadius: BorderRadius.circular(AppResponsive.radiusSmall),
          ),
        ),
      ),
    );
  }
}
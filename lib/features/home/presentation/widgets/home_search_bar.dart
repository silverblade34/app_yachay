import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(horizontal: 24, vertical: 18),
      child: Container(
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppResponsive.radiusLarge),
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: TextField(
          style: AppResponsive.textStyle(
              color: AppColors.textDark,
              fontSize: AppResponsive.fontSizeSmall),
          decoration: InputDecoration(
            hintText: 'Buscar temas, materias o crear nueva prueba...',
            hintStyle: AppResponsive.textStyle(
                color: AppColors.textDarkSubtitle,
                fontSize: AppResponsive.fontSizeSmall),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primary,
              size: AppResponsive.iconSizeMedium,
            ),
            border: InputBorder.none,
            contentPadding: AppResponsive.paddingSymmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }
}

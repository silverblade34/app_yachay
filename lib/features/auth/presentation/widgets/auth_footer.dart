import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/config/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(vertical: 38, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿No tienes cuenta? ',
              style: AppResponsive.descriptionLoginStyle),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.register),
            child: Text(
              'Regístrate',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppResponsive.fontSizeMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

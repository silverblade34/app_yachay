import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupSuccessDialog extends StatelessWidget {
  final VoidCallback onComplete;

  const ProfileSetupSuccessDialog({
    super.key,
    required this.onComplete,
  });

  static void show({required VoidCallback onComplete}) {
    Get.dialog(
      ProfileSetupSuccessDialog(onComplete: onComplete),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundDarkIntense,
      shape: RoundedRectangleBorder(
        borderRadius: AppResponsive.borderRadiusXLarge,
      ),
      child: Padding(
        padding: AppResponsive.paddingLarge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.celebration,
              color: AppColors.primary,
              size: AppResponsive.width(40),
            ),
            AppResponsive.verticalSpace16,
            Text(
              '¡Perfil completado!',
              style: AppResponsive.textStyle(
                fontSize: AppResponsive.fontSizeXLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textDarkTitle,
              ),
            ),
            AppResponsive.verticalSpace8,
            Text(
              'Tu IA personal está lista para crear exámenes personalizados',
              style: AppResponsive.textStyle(
                fontSize: AppResponsive.fontSizeRegular,
                color: AppColors.textDarkSubtitle,
              ),
              textAlign: TextAlign.center,
            ),
            AppResponsive.verticalSpace24,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: AppResponsive.paddingSymmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppResponsive.borderRadiusLarge,
                  ),
                ),
                child: Text(
                  '¡Empezar!',
                  style: AppResponsive.textStyle(
                    fontSize: AppResponsive.fontSizeRegular,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

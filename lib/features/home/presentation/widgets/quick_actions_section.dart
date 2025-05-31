import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/config/routes/pages.dart';
import 'package:app_yachay/features/home/presentation/widgets/quick_action_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(horizontal: 24),
      child: Row(
        children: [
          // Crear Prueba
          Expanded(
            child: QuickActionCard(
              title: 'Crear Prueba',
              subtitle: 'De idea a examen en 30s',
              icon: Icons.add,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
              onTap: () => Get.toNamed(Routes.createTest),
              margin: AppResponsive.paddingOnly(right: 8),
            ),
          ),

          // IA Personal
          Expanded(
            child: QuickActionCard(
              title: 'IA Personal',
              subtitle: 'Tutor inteligente',
              icon: Icons.psychology,
              gradient: LinearGradient(
                colors: [AppColors.secondary, AppColors.secondaryDark],
              ),
              onTap: () {
                // Navegar a IA Personal
              },
              margin: AppResponsive.paddingOnly(left: 8),
            ),
          ),
        ],
      ),
    );
  }
}
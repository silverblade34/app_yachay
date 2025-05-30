import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/profile_setup/profile_setup_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupHeader extends StatelessWidget {
  final ProfileSetupController controller;

  const ProfileSetupHeader({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppResponsive.paddingRegular,
      child: Column(
        children: [
          // Logo/Avatar
          _buildProfileAvatar(),
          AppResponsive.verticalSpace16,

          // Título y subtítulo dinámicos
          Obx(() => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildTitleSection(
                  key: ValueKey(controller.currentStep.value),
                ),
              )),

          AppResponsive.verticalSpace20,
          
          // Indicador de progreso modularizado
          Obx(() => ProfileSetupProgressIndicator(
                currentStep: controller.currentStep.value,
                totalSteps: 3,
              )),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: AppResponsive.width(60),
      height: AppResponsive.height(60),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        Icons.person_outline,
        color: AppColors.textDark,
        size: AppResponsive.iconSizeLarge,
      ),
    );
  }

  Widget _buildTitleSection({Key? key}) {
    return Column(
      key: key,
      children: [
        Text(
          _getDynamicTitle(),
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeXLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textDarkTitle,
          ),
        ),
        AppResponsive.verticalSpace8,
        Text(
          _getDynamicSubtitle(),
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeRegular,
            color: AppColors.textDarkSubtitle,
          ),
        ),
      ],
    );
  }

  String _getDynamicTitle() {
    switch (controller.currentStep.value) {
      case 0:
        return '¡Configuremos tu perfil!';
      case 1:
        return 'Elige tu foto de perfil';
      case 2:
        return 'Tus intereses';
      default:
        return '¡Personaliza tu IA de aprendizaje!';
    }
  }

  String _getDynamicSubtitle() {
    switch (controller.currentStep.value) {
      case 0:
        return 'Personaliza tu experiencia de aprendizaje';
      case 1:
        return 'Elige cómo quieres verte';
      case 2:
        return 'Selecciona tus temas favoritos';
      default:
        return 'Enséñale a tu asistente qué sabes y qué quieres aprender';
    }
  }
}
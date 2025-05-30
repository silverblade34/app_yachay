// 1. VISTA PRINCIPAL - ProfileSetupPage
import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/views/interests_step.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/views/personal_info_step.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/views/profile_photo_step.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupPage extends GetView<ProfileSetupController> {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header optimizado con título dinámico
            _buildOptimizedHeader(),
            // Contenido principal
            Expanded(
              child: Obx(() {
                switch (controller.currentStep.value) {
                  case 0:
                    return PersonalInfoStep();
                  case 1:
                    return ProfilePhotoStep();
                  case 2:
                    return InterestsStep();
                  default:
                    return PersonalInfoStep();
                }
              }),
            ),
            // Navegación inferior
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildOptimizedHeader() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          // Logo de la llama (más pequeño)
          Container(
            width: 60,
            height: 60,
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
              size: 30,
            ),
          ),
          SizedBox(height: 16),
          
          // Título dinámico según el paso actual
          Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Column(
              key: ValueKey(controller.currentStep.value),
              children: [
                Text(
                  _getDynamicTitle(),
                  style: TextStyle(
                    color: AppColors.textDarkTitle,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _getDynamicSubtitle(),
                  style: TextStyle(
                    color: AppColors.textDarkSubtitle,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
          
          SizedBox(height: 20),
          // Indicador de progreso
          Obx(() => _buildProgressIndicator()),
        ],
      ),
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
        return '¡Configuremos tu perfil!';
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
        return 'Personaliza tu experiencia de aprendizaje';
    }
  }

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = index <= controller.currentStep.value;
        bool isCurrent = index == controller.currentStep.value;
        return Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isCurrent ? 12 : 8,
              height: isCurrent ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppColors.primary : AppColors.textDarkSubtitle,
                boxShadow: isCurrent ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ] : null,
              ),
            ),
            if (index < 2) Container(
              width: 40,
              height: 2,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.textDarkSubtitle,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Botón Atrás
            if (controller.currentStep.value > 0)
              ElevatedButton(
                onPressed: controller.previousStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundDarkIntense,
                  foregroundColor: AppColors.textDark,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.textDark,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Atrás',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            else
              SizedBox.shrink(),
            
            // Espaciador
            Spacer(),
            
            // Botón Siguiente
            _buildNextButton(),
          ],
        );
      }),
    );
  }

  Widget _buildNextButton() {
    return Obx(() {
      final canProceed = _canProceedCurrentStep();
      final isLastStep = controller.currentStep.value == 2;
      
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: ElevatedButton(
          onPressed: canProceed ? (isLastStep ? _completeSetup : controller.nextStep) : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: canProceed ? AppColors.primary : AppColors.textDarkSubtitle,
            foregroundColor: AppColors.textDark,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: canProceed ? 8 : 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isLastStep ? 'Finalizar' : 'Siguiente',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                isLastStep ? Icons.check_rounded : Icons.arrow_forward_rounded,
                color: canProceed ? Colors.white : AppColors.textDarkSubtitle,
              ),
            ],
          ),
        ),
      );
    });
  }

  bool _canProceedCurrentStep() {
    switch (controller.currentStep.value) {
      case 0:
        return controller.canProceedStep1();
      case 1:
        return controller.canProceedStep2();
      case 2:
        return controller.canProceedStep3();
      default:
        return false;
    }
  }

  void _completeSetup() {
    // Aquí implementarías la lógica para completar el setup
    // Por ejemplo, guardar los datos y navegar a la siguiente pantalla
    print('Setup completado');
  }
}
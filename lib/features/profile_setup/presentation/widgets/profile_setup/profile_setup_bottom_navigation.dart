import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_setup_navigation_button.dart';

class ProfileSetupBottomNavigation extends StatelessWidget {
  final ProfileSetupController controller;
  final VoidCallback onSuccess;

  const ProfileSetupBottomNavigation({
    super.key,
    required this.controller,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppResponsive.paddingSymmetric(
        vertical: 5,
        horizontal: 24,
      ),
      child: Obx(() {
        // Si estamos en el último paso, mostramos el botón final
        if (controller.currentStep.value == 2) {
          return _buildFinalButton();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Botón Atrás
            if (controller.currentStep.value > 0)
              ProfileSetupNavigationButton.back(
                onPressed: controller.previousStep,
              )
            else
              const SizedBox.shrink(),

            const Spacer(),

            // Botón Siguiente
            _buildNextButton(),
          ],
        );
      }),
    );
  }

  Widget _buildFinalButton() {
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        final canProceed = controller.canProceedStep3();
        return ProfileSetupNavigationButton.finish(
          canProceed: canProceed,
          onPressed: canProceed ? onSuccess : null,
        );
      }),
    );
  }

  Widget _buildNextButton() {
    return Obx(() {
      final canProceed = _canProceedCurrentStep();
      final isLastStep = controller.currentStep.value == 2;

      if (isLastStep) {
        return const SizedBox.shrink();
      }

      return ProfileSetupNavigationButton.next(
        canProceed: canProceed,
        onPressed: canProceed ? controller.nextStep : null,
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
}
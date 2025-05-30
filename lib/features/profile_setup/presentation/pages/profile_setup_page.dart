import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/profile_setup/profile_setup_bottom_navigation.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/profile_setup/profile_setup_header.dart';
import 'package:app_yachay/features/profile_setup/presentation/widgets/profile_setup/profile_setup_success_dialog.dart';
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
            ProfileSetupHeader(controller: controller),
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
            ProfileSetupBottomNavigation(
              controller: controller,
              onSuccess: _showSuccessDialog,
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    ProfileSetupSuccessDialog.show(
      onComplete: () => Get.offAllNamed('/home'),
    );
  }
}

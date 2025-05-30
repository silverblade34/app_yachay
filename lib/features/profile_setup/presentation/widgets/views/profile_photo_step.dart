import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePhotoStep extends StatelessWidget {
  ProfilePhotoStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppResponsive.paddingOnly(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppResponsive.verticalSpace12,

          Obx(() {
            return Container(
              width: AppResponsive.width(100),
              height: AppResponsive.height(100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 13,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: controller.selectedAvatar.value.isNotEmpty
                  ? ClipOval(
                      child: Image.asset(
                        controller.selectedAvatar.value,
                        fit: BoxFit.contain,
                      ),
                    )
                  : controller.profileImage.value.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            controller.profileImage.value,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: AppResponsive.iconSizeXLarge,
                          color: AppColors.textDark,
                        ),
            );
          }),

          AppResponsive.verticalSpace16,

          _buildPhotoOption(
            title: 'Subir mi foto',
            subtitle: 'Usa una foto desde tu galería',
            icon: Icons.camera_alt_rounded,
            onTap: () {},
          ),

          AppResponsive.verticalSpace16,

          Text(
            'O elige un avatar',
            style: AppResponsive.textStyle(
              fontSize: AppResponsive.fontSizeLarge,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkTitle,
            ),
          ),

          AppResponsive.verticalSpace16,

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppResponsive.spacing16,
              mainAxisSpacing: AppResponsive.spacing16,
            ),
            itemCount: controller.avatarOptions.length,
            itemBuilder: (context, index) {
              final avatar = controller.avatarOptions[index];
              return Obx(() {
                final isSelected = controller.selectedAvatar.value == avatar;
                return GestureDetector(
                  onTap: () {
                    controller.selectedAvatar.value = avatar;
                    controller.profileImage.value = '';
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: AppColors.primary.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        avatar,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              });
            },
          ),

          AppResponsive.verticalSpace40,
        ],
      ),
    );
  }

  Widget _buildPhotoOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppResponsive.paddingXRegular,
        decoration: BoxDecoration(
          color: AppColors.backgroundDarkIntense,
          borderRadius: AppResponsive.borderRadiusRegular,
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            AppResponsive.horizontalSpace16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppResponsive.textStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppResponsive.fontSizeRegular,
                      color: AppColors.textDarkTitle,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppResponsive.textStyle(
                      fontSize: AppResponsive.fontSizeSmall,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

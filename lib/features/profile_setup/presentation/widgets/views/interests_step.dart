import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InterestsStep extends StatelessWidget {
  InterestsStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppResponsive.paddingLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSelectionCounters(),

          AppResponsive.verticalSpace16,

          _buildSectionTitle(
            '🎯 ¿Qué te gusta?',
            'Temas que ya conoces o te interesan',
          ),
          AppResponsive.verticalSpace16,
          _buildInterestsGrid(isPreferences: true),

          AppResponsive.verticalSpace16,

          _buildSectionTitle(
            '🚀 ¿Qué quieres aprender?',
            'Nuevas áreas que quieres explorar',
          ),
          AppResponsive.verticalSpace16,
          _buildInterestsGrid(isPreferences: false),

          AppResponsive.verticalSpace40,
        ],
      ),
    );
  }

  Widget _buildSelectionCounters() {
    return Obx(() {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: AppResponsive.paddingSymmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: AppResponsive.borderRadiusXLarge,
              ),
              child: Text(
                '${controller.selectedPreferences.length} te gustan',
                style: AppResponsive.textStyle(
                  fontSize: AppResponsive.fontSizeXSmall,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppResponsive.horizontalSpace12,
          Expanded(
            child: Container(
              padding: AppResponsive.paddingSymmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.orange.withOpacity(0.2),
                borderRadius: AppResponsive.borderRadiusXLarge,
              ),
              child: Text(
                '${controller.selectedLearningGoals.length} quieres aprender',
                style: AppResponsive.textStyle(
                  fontSize: AppResponsive.fontSizeXSmall,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeRegular,
            fontWeight: FontWeight.bold,
            color: AppColors.textDarkTitle,
          ),
        ),
        AppResponsive.verticalSpace4,
        Text(
          subtitle,
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeMedium,
            color: AppColors.textDarkSubtitle,
          ),
        ),
      ],
    );
  }

  Widget _buildInterestsGrid({required bool isPreferences}) {
    return Obx(() {
      final selectedList = isPreferences
          ? controller.selectedPreferences
          : controller.selectedLearningGoals;
      final primaryColor = isPreferences ? AppColors.primary : Colors.orange;

      return Wrap(
        spacing: AppResponsive.spacing4,
        runSpacing: AppResponsive.spacing4,
        children: controller.availableTopics.map((topic) {
          final isSelected = selectedList.contains(topic);
          return GestureDetector(
            onTap: () => isPreferences
                ? controller.togglePreference(topic)
                : controller.toggleLearningGoal(topic),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: AppResponsive.paddingSymmetric(
                  horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color:
                    isSelected ? primaryColor : AppColors.backgroundDarkIntense,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color:
                      // ignore: deprecated_member_use
                      isSelected ? primaryColor : primaryColor.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Text(
                topic,
                style: AppResponsive.textStyle(
                  fontSize: AppResponsive.fontSizeSmall,
                  color: isSelected
                      ? Colors.white
                      : AppColors.textDarkTitle,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}


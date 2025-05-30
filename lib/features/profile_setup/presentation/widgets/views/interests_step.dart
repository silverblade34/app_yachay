import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestsStep extends StatelessWidget {
  InterestsStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contadores de selección
          _buildSelectionCounters(),

          SizedBox(height: 32),

          // Sección: ¿Qué te gusta?
          _buildSectionTitle(
            '🎯 ¿Qué te gusta?',
            'Temas que ya conoces o te interesan',
          ),
          SizedBox(height: 16),
          _buildInterestsGrid(isPreferences: true),

          SizedBox(height: 32),

          // Sección: ¿Qué quieres aprender?
          _buildSectionTitle(
            '🚀 ¿Qué quieres aprender?',
            'Nuevas áreas que quieres explorar',
          ),
          SizedBox(height: 16),
          _buildInterestsGrid(isPreferences: false),

          SizedBox(height: 40),
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${controller.selectedPreferences.length} te gustan',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${controller.selectedLearningGoals.length} quieres aprender',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
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
          style: TextStyle(
            color: AppColors.textDarkTitle,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.textDarkSubtitle,
            fontSize: 14,
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
        spacing: 12,
        runSpacing: 12,
        children: controller.availableTopics.map((topic) {
          final isSelected = selectedList.contains(topic);
          return GestureDetector(
            onTap: () => isPreferences
                ? controller.togglePreference(topic)
                : controller.toggleLearningGoal(topic),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color:
                    isSelected ? primaryColor : AppColors.backgroundDarkIntense,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color:
                      isSelected ? primaryColor : primaryColor.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Text(
                topic,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textDarkTitle,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}

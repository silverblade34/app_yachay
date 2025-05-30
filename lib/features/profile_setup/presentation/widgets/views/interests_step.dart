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
          SizedBox(height: 24),

          // Contador de seleccionados
          Obx(() {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${controller.selectedInterests.length} seleccionados',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }),

          SizedBox(height: 24),

          // Grid de intereses
          Obx(() {
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: controller.interestOptions.map((interest) {
                final isSelected =
                    controller.selectedInterests.contains(interest);
                return GestureDetector(
                  onTap: () => controller.toggleInterest(interest),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.backgroundDarkIntense,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        width: 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                    child: Text(
                      interest,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.textDark
                            : AppColors.textDarkTitle,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),

          SizedBox(height: 40),

          // Botón finalizar
          _buildFinishButton(),
        ],
      ),
    );
  }

  Widget _buildFinishButton() {
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        final canProceed = controller.canProceedStep3();
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: ElevatedButton(
            onPressed: canProceed
                ? () {
                    // Aquí guardarías los datos del perfil
                    Get.offAllNamed('/home'); // Navegar a la pantalla principal
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  canProceed ? AppColors.primary : AppColors.textDarkSubtitle,
              foregroundColor: AppColors.textDark,
              padding: EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: canProceed ? 8 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: canProceed ? Colors.white : AppColors.textDarkSubtitle,
                ),
                SizedBox(width: 8),
                Text(
                  '¡Finalizar Configuración!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

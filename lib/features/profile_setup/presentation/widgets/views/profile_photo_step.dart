import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePhotoStep extends StatelessWidget {
  ProfilePhotoStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24), // Menos padding arriba
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ya no necesitamos el título y botón atrás aquí
          SizedBox(height: 16), // Espacio reducido

          // Vista previa del perfil actual
          Obx(() {
            return Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
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
                          size: 60,
                          color: AppColors.textDark,
                        ),
            );
          }),

          SizedBox(height: 32),

          // Opción de subir foto
          _buildPhotoOption(
            title: 'Subir mi foto',
            subtitle: 'Usa una foto desde tu galería',
            icon: Icons.camera_alt_rounded,
            onTap: () {
              // Aquí implementarías la lógica para seleccionar foto
              // controller.profileImage.value = 'path_to_image';
            },
          ),

          SizedBox(height: 24),

          Text(
            'O elige un avatar',
            style: TextStyle(
              color: AppColors.textDarkTitle,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16),

          // Grid de avatares
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.avatarOptions.length,
            itemBuilder: (context, index) {
              final avatar = controller.avatarOptions[index];
              return Obx(() {
                final isSelected = controller.selectedAvatar.value == avatar;
                return GestureDetector(
                  onTap: () {
                    controller.selectedAvatar.value = avatar;
                    // Limpiar la imagen de perfil si se selecciona un avatar
                    controller.profileImage.value = '';
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
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
                      )),
                );
              });
            },
          ),

          SizedBox(height: 40),
          // El botón de navegación ahora está en la parte inferior de la página principal
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
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundDarkIntense,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textDarkTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.textDarkSubtitle,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textDarkSubtitle,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/constants/fonts.dart';
import 'package:app_yachay/core/widgets/custom_text_field.dart';
import 'package:app_yachay/core/widgets/google_sign_in_button.dart';
import 'package:app_yachay/features/auth/controllers/auth_controller.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_button.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_dividir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                _buildRegisterForm(),
                const SizedBox(height: 24),
                AuthButton(
                  isLoading: controller.isLoading,
                  onPressed: controller.registerWithEmail,
                  text: 'Crear Cuenta',
                  fontSize: 14,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                const SizedBox(height: 24),
                AuthDivider(text: 'o regístrate con'),
                const SizedBox(height: 24),
                _buildSocialRegister(),
                const SizedBox(height: 32),
                //_buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.backgroundDarkIntense,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                //color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  // ignore: deprecated_member_use
                  color: AppColors.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  ConstanceData.yachaMonocramaticoCelebrandoBlanco,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(width: 44.w),
          ],
        ),
        SizedBox(height: 28.h),
        Text('¡Únete a Yachay!', style: AppFonts.titleLogin),
        SizedBox(height: 8.h),
        Text(
          'Crea tu cuenta y comienza a aprender',
          style: AppFonts.descriptionLogin,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        CustomTextField(
          controller: controller.nameController,
          hintText: 'Nombre',
          icon: Icons.person_outline,
        ),
        SizedBox(height: 14.h),
        CustomTextField(
          controller: controller.emailController,
          hintText: 'Email',
          icon: Icons.email_outlined,
        ),
        SizedBox(height: 14.h),
        Obx(() => CustomTextField(
              controller: controller.passwordController,
              hintText: 'Contraseña',
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: controller.isPasswordHidden.value,
              onToggleVisibility: controller.togglePasswordVisibility,
            )),
        SizedBox(height: 14.h),
        Obx(() => CustomTextField(
              controller: controller.confirmPasswordController,
              hintText: 'Confirmar contraseña',
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: controller.isConfirmPasswordHidden.value,
              onToggleVisibility: controller.toggleConfirmPasswordVisibility,
            )),
        SizedBox(height: 14.h),
        _buildTermsCheckbox(),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.acceptTerms.value,
            onChanged: (value) => controller.acceptTerms.value = value!,
            activeColor: AppColors.primary,
            checkColor: Colors.white,
            // ignore: deprecated_member_use
            side: BorderSide(color: Colors.white.withOpacity(0.3)),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(text: 'Acepto los '),
                  TextSpan(
                    text: 'Términos y Condiciones',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' y la '),
                  TextSpan(
                    text: 'Política de Privacidad',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialRegister() {
    return GoogleSignInButton(
      buttonText: 'Regístrate con Google',
      onPressed: controller.loginWithGoogle,
    );
  }
}

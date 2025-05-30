import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/constants/fonts.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/core/widgets/custom_text_field.dart';
import 'package:app_yachay/core/widgets/google_sign_in_button.dart';
import 'package:app_yachay/features/auth/controllers/auth_controller.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_button.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_dividir.dart';
import 'package:flutter/material.dart';
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
            padding: AppResponsive.paddingLarge,
            child: Column(
              children: [
                _buildHeader(),
                AppResponsive.verticalSpace32,
                _buildRegisterForm(),
                AppResponsive.verticalSpace20,
                AuthButton(
                  isLoading: controller.isLoading,
                  onPressed: controller.registerWithEmail,
                  text: 'Crear Cuenta',
                  fontSize: AppResponsive.fontSizeRegular,
                  padding: AppResponsive.paddingVertical,
                ),
                AppResponsive.verticalSpace12,
                const AuthDivider(text: 'o regístrate con'),
                AppResponsive.verticalSpace12,
                _buildSocialRegister(),
                AppResponsive.verticalSpace32,
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
                padding: AppResponsive.paddingSymmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundDarkIntense,
                  borderRadius: AppResponsive.borderRadiusRegular,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: AppResponsive.iconSizeMedium,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: AppResponsive.width(80),
              height: AppResponsive.height(80),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  // ignore: deprecated_member_use
                  color: AppColors.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: AppResponsive.paddingSmall,
                child: Image.asset(
                  ConstanceData.yachaMonocramaticoCelebrandoBlanco,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(width: AppResponsive.width(44)),
          ],
        ),
        AppResponsive.verticalSpace(28),
        Text(
          '¡Únete a Yachay!',
          style: AppFonts.titleLogin,
        ),
        AppResponsive.verticalSpace8,
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
        AppResponsive.verticalSpace(14),
        CustomTextField(
          controller: controller.emailController,
          hintText: 'Email',
          icon: Icons.email_outlined,
        ),
        AppResponsive.verticalSpace(14),
        Obx(() => CustomTextField(
              controller: controller.passwordController,
              hintText: 'Contraseña',
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: controller.isPasswordHidden.value,
              onToggleVisibility: controller.togglePasswordVisibility,
            )),
        AppResponsive.verticalSpace(14),
        Obx(() => CustomTextField(
              controller: controller.confirmPasswordController,
              hintText: 'Confirmar contraseña',
              icon: Icons.lock_outline,
              isPassword: true,
              isObscure: controller.isConfirmPasswordHidden.value,
              onToggleVisibility: controller.toggleConfirmPasswordVisibility,
            )),
        AppResponsive.verticalSpace(14),
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
                style: AppResponsive.textStyle(
                  fontSize: AppResponsive.fontSizeSmall,
                  color: Colors.white70,
                ),
                children: [
                  const TextSpan(text: 'Acepto los '),
                  TextSpan(
                    text: 'Términos y Condiciones',
                    style: AppResponsive.textStyle(
                      fontSize: AppResponsive.fontSizeSmall,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' y la '),
                  TextSpan(
                    text: 'Política de Privacidad',
                    style: AppResponsive.textStyle(
                      fontSize: AppResponsive.fontSizeSmall,
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
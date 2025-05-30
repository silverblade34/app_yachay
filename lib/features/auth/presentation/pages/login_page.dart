import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/core/widgets/custom_text_field.dart';
import 'package:app_yachay/core/widgets/google_sign_in_button.dart';
import 'package:app_yachay/features/auth/controllers/auth_controller.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_button.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_dividir.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_footer.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_header.dart';
import 'package:app_yachay/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: AppResponsive.getFullHeight(context),
            child: Column(
              children: [
                const AuthHeader(),
                Expanded(child: _buildLoginForm()),
                const AuthFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: AppResponsive.paddingHorizontal,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.emailController,
            hintText: 'Email',
            icon: Icons.email_outlined,
          ),
          AppResponsive.verticalSpace16,
          Obx(() => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Contraseña',
                icon: Icons.lock_outline,
                isPassword: true,
                isObscure: controller.isPasswordHidden.value,
                onToggleVisibility: controller.togglePasswordVisibility,
              )),
          AppResponsive.verticalSpace12,
          _buildRememberAndForgot(),
          AppResponsive.verticalSpace12,
          AuthButton(
            isLoading: controller.isLoading,
            onPressed: controller.loginWithEmail,
            text: 'Iniciar Sesión',
            fontSize: AppResponsive.fontSizeRegular,
            padding: AppResponsive.paddingVertical,
          ),
          AppResponsive.verticalSpace12,
          const AuthDivider(text: 'o continúa con'),
          AppResponsive.verticalSpace12,
          _buildSocialLogin(),
        ],
      ),
    );
  }

  Widget _buildRememberAndForgot() {
    return Row(
      children: [
        Obx(() => Row(
              children: [
                Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value) => controller.rememberMe.value = value!,
                  activeColor: AppColors.primary,
                  checkColor: Colors.white,
                  // ignore: deprecated_member_use
                  side: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                Text(
                  'Recordarme',
                  style: AppResponsive.checkboxTextStyle,
                ),
              ],
            )),
        const Spacer(),
        GestureDetector(
          onTap: controller.forgotPassword,
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: AppResponsive.linkTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        GoogleSignInButton(
          buttonText: 'Continúa con Google',
          onPressed: controller.loginWithGoogle,
        ),
        AppResponsive.verticalSpace16,
        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                onTap: () {},
              ),
            ),
            AppResponsive.horizontalSpace12,
            Expanded(
              child: SocialButton(
                icon: Icons.apple,
                color: Colors.white,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/core/widgets/custom_text_field.dart';
import 'package:app_yachay/core/widgets/google_sign_in_button.dart';
import 'package:app_yachay/features/auth/controllers/auth_controller.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_button.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_dividir.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_footer.dart';
import 'package:app_yachay/features/auth/presentation/widgets/auth_header.dart';
import 'package:app_yachay/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 1.sh - MediaQuery.of(context).padding.top,
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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          CustomTextField(
            controller: controller.emailController,
            hintText: 'Email',
            icon: Icons.email_outlined,
          ),
          SizedBox(height: 16.h),
          Obx(() => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Contraseña',
                icon: Icons.lock_outline,
                isPassword: true,
                isObscure: controller.isPasswordHidden.value,
                onToggleVisibility: controller.togglePasswordVisibility,
              )),
          SizedBox(height: 12.h),
          _buildRememberAndForgot(),
          SizedBox(height: 12.h),
          AuthButton(
            isLoading: controller.isLoading,
            onPressed: controller.loginWithEmail,
            text: 'Iniciar Sesión',
            fontSize: 14,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          SizedBox(height: 12.h),
          const AuthDivider(text: 'o continúa con'),
          SizedBox(height: 12.h),
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
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )),
        const Spacer(),
        GestureDetector(
          onTap: controller.forgotPassword,
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
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
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                onTap: () {},
              ),
            ),
            SizedBox(width: 12.w),
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

import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var rememberMe = false.obs;
  var acceptTerms = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  // AWS Cognito Login Methods
  Future<void> loginWithEmail() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Por favor completa todos los campos',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;
    try {
      // Aquí integrarías AWS Cognito
      await Future.delayed(const Duration(seconds: 2)); // Simulación
      
      Get.snackbar(
        '¡Bienvenido!',
        'Has iniciado sesión exitosamente',
        backgroundColor: AppColors.primary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      
      // Navegar al Home
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Credenciales incorrectas',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    isLoading.value = true;
    try {
      // Integración con AWS Cognito + Google
      await Future.delayed(const Duration(seconds: 2)); // Simulación
      
      Get.snackbar(
        '¡Bienvenido!',
        'Has iniciado sesión con Google',
        backgroundColor: AppColors.primary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo iniciar sesión con Google',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerWithEmail() async {
    if (!_validateRegistrationForm()) return;

    isLoading.value = true;
    try {
      // Integración con AWS Cognito
      await Future.delayed(const Duration(seconds: 2)); // Simulación
      
      Get.snackbar(
        '¡Registro exitoso!',
        'Revisa tu email para verificar tu cuenta',
        backgroundColor: AppColors.primary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      
      Get.offNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo crear la cuenta',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateRegistrationForm() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Por favor completa todos los campos',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Las contraseñas no coinciden',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    if (!acceptTerms.value) {
      Get.snackbar(
        'Error',
        'Debes aceptar los términos y condiciones',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    return true;
  }

  Future<void> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Ingresa tu email para recuperar la contraseña',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      // AWS Cognito forgot password
      await Future.delayed(const Duration(seconds: 1));
      
      Get.snackbar(
        'Email enviado',
        'Revisa tu correo para restablecer tu contraseña',
        backgroundColor: AppColors.primary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo enviar el email de recuperación',
        backgroundColor: AppColors.secondary,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}

import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/routes/pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class IntroController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxBool _isNavigating = false.obs;

  final List<Map<String, dynamic>> introData = [
    {
      'imagePath': ConstanceData.yachayIntro1,
      'title': 'Tu Conocimiento, Sin Fronteras',
      'description':
          'Lleva el aprendizaje a donde vayas. Con Yachay, cada momento libre se transforma en una oportunidad de crecimiento, ¡tu educación te acompaña 24/7!',
    },
    {
      'imagePath': ConstanceData.yachayIntro2,
      'title': 'Aprende a Tu Ritmo con Yachay IA',
      'description':
          'Nuestra IA de vanguardia entiende tu forma única de aprender, creando exámenes y contenido que se adaptan a tu nivel y desafían tu curiosidad.',
    },
    {
      'imagePath': ConstanceData.yachayIntro3,
      'title': '¡Listo para Transformar tu Aprendizaje!',
      'description':
          'Con Yachay, el saber se vuelve un juego global. Prepárate para competir, colaborar y crecer con una comunidad apasionada. ¡Desliza para empezar tu aventura!',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      if (pageController.page == null) return;
      int newPage = pageController.page!.round();
      if (newPage != currentPage.value) {
        currentPage.value = newPage;
      }
    });
  }

  // Métodos de navegación
  bool canGoPrevious() => currentPage.value > 0;
  
  bool canGoNext() => currentPage.value < introData.length - 1;
  
  bool isLastPage() => currentPage.value == introData.length - 1;

  void goToPreviousPage() {
    if (canGoPrevious() && !_isNavigating.value) {
      _isNavigating.value = true;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        _isNavigating.value = false;
      });
    }
  }

  void goToNextPage() {
    if (canGoNext() && !_isNavigating.value) {
      _isNavigating.value = true;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        _isNavigating.value = false;
      });
    }
  }

  void goToLogin() {
    if (!_isNavigating.value) {
      _isNavigating.value = true;
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

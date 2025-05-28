import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/routes/pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';


class IntroController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

 final List<Map<String, dynamic>> introData = [
    {
      'imagePath': ConstanceData.yachayCelular,
      'title': 'Tu Conocimiento, Sin Fronteras', // Más impactante
      'description':
          'Lleva el aprendizaje a donde vayas. Con Yachay, cada momento libre se transforma en una oportunidad de crecimiento, ¡tu educación te acompaña 24/7!',
    },
    {
      'imagePath': ConstanceData.yachayPensando,
      'title': 'Aprende a Tu Ritmo con Yachay IA', // Más personalizado
      'description':
          'Nuestra IA de vanguardia entiende tu forma única de aprender, creando exámenes y contenido que se adaptan a tu nivel y desafían tu curiosidad.',
    },
    {
      'imagePath': ConstanceData.yachayCelebrando,
      'title': '¡Listo para Transformar tu Aprendizaje!', // Sugiere el final
      'description':
          'Con Yachay, el saber se vuelve un juego global. Prepárate para competir, colaborar y crecer con una comunidad apasionada. ¡Desliza para empezar tu aventura!',
    },
  ];


  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      if (pageController.page != null &&
          pageController.page!.round() != currentPage.value) {
        currentPage.value = pageController.page!.round();
        if (currentPage.value == introData.length - 1 && pageController.page! > introData.length - 1.5) {
          Future.delayed(const Duration(milliseconds: 2000), () {
             if (Get.currentRoute != Routes.login) {
                Get.offAllNamed(Routes.login);
            }
          });
        }
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
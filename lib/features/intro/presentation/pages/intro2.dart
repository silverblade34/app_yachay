import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/routes/pages.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro1.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_content.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_indicators.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroLayout(
      imagePath: ConstanceData.yachayCelebrando,
      content: const IntroContent(
        title: 'Celebra cada logro',
        description:
                      'Cada respuesta correcta, cada nivel completado, cada meta alcanzada. En Yachay, tu progreso se convierte en una fiesta de conocimiento.',
      ),
      indicators: IntroIndicators(
        onBack: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Intro1())),
        onNext: () => Get.offAllNamed(Routes.home),
        activeIndex: [2],
      ),
    );
  }
}
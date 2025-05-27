import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/features/intro/controllers/intro_controller.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro1.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_content.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_indicators.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroLayout(
      imagePath: ConstanceData.yachayCelular,
      content: const IntroContent(
        title: 'Aprende desde cualquier lugar',
        description:
                        'Convierte cada momento libre en una oportunidad de crecimiento. Con Yachay, tu conocimiento viaja contigo las 24 horas del día.',
      ),
      indicators: IntroIndicators(
        onNext: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Intro1())),
        activeIndex: [0],
      ),
    );
  }
}
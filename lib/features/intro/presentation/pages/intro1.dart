import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro2.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro_page.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_content.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_indicators.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_layout.dart';
import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroLayout(
      imagePath: ConstanceData.yachayPensando,
      content: const IntroContent(
        title: 'IA que se adapta a ti',
        description:
            'Nuestra inteligencia artificial comprende tu estilo de aprendizaje y crea contenido personalizado que desafía tu mente al nivel perfecto.',
      ),
      indicators: IntroIndicators(
        onBack: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IntroPage())),
        onNext: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Intro2())),
        activeIndex: [1],
      ),
    );
  }
}

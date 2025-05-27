import 'package:app_yachay/config/constants/constance.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Image.asset(
            ConstanceData.yachaySaludando,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
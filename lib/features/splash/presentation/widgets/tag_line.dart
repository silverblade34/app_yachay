import 'package:flutter/material.dart';

class TagLine extends StatelessWidget {
  const TagLine({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 2500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 15 * (1 - value)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Aprende sin límites con IA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

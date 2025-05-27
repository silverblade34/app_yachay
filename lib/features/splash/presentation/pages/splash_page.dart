import 'package:app_yachay/features/splash/controllers/splash_controller.dart';
import 'package:app_yachay/features/splash/presentation/widgets/animated_logo.dart';
import 'package:app_yachay/features/splash/presentation/widgets/app_title.dart';
import 'package:app_yachay/features/splash/presentation/widgets/footer.dart';
import 'package:app_yachay/features/splash/presentation/widgets/loading_indicator.dart';
import 'package:app_yachay/features/splash/presentation/widgets/tag_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final description = controller.description;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              // ignore: deprecated_member_use
              const Color.fromARGB(255, 18, 77, 73),
              // ignore: deprecated_member_use
              const Color.fromARGB(255, 43, 118, 113),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedLogo(),
                    const SizedBox(height: 40),
                    AppTitle(),
                    const SizedBox(height: 16),
                    TagLine(
                      description: description,
                    ),
                    const SizedBox(height: 60),
                    LoadingIndicator(),
                  ],
                ),
              ),
              Footer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app_yachay/features/intro/bindings/intro_binding.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro_page.dart';
import 'package:app_yachay/features/splash/bindings/splash_binding.dart';
import 'package:app_yachay/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.intro,
      page: () => const IntroPage(),
      binding: IntroBinding(),
      transition: Transition.fadeIn,
    )
  ];
}

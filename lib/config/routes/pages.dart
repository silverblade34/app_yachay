import 'package:app_yachay/features/auth/bindings/login_binding.dart';
import 'package:app_yachay/features/auth/bindings/register_binding.dart';
import 'package:app_yachay/features/auth/presentation/pages/login_page.dart';
import 'package:app_yachay/features/auth/presentation/pages/register_page.dart';
import 'package:app_yachay/features/create_test/bindings/create_test_binding.dart';
import 'package:app_yachay/features/create_test/presentation/pages/create_test_page.dart';
import 'package:app_yachay/features/home/bindings/home_binding.dart';
import 'package:app_yachay/features/home/presentation/pages/home_page.dart';
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
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.createTest,
      page: () => const CreateTestPage(),
      binding: CreateTestBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    )
  ];
}

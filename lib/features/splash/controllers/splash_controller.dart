import 'package:app_yachay/config/routes/pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  String description = "Aprende sin limites con IA";
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.intro);
    });
  }
}
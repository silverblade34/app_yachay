import 'package:app_yachay/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AuthController>(() => AuthController());
  }
}
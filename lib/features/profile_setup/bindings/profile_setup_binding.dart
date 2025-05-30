import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:get/get.dart';

class ProfileSetupBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ProfileSetupController>(() => ProfileSetupController());
  }
}
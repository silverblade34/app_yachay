import 'package:app_yachay/features/create_test/controllers/create_test_controller.dart';
import 'package:get/get.dart';

class CreateTestBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<CreateTestController>(() => CreateTestController());
  }
}
import 'package:get/get.dart';

import '../controllers/simple_mode_controller.dart';

class SimpleModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimpleModeController>(
      () => SimpleModeController(),
    );
  }
}

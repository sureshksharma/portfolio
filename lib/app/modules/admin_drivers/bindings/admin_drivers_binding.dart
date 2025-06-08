import 'package:get/get.dart';

import '../controllers/admin_drivers_controller.dart';

class AdminDriversBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDriversController>(
      () => AdminDriversController(),
    );
  }
}

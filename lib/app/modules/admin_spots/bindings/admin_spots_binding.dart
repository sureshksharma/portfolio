import 'package:get/get.dart';

import '../controllers/admin_spots_controller.dart';

class AdminSpotsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSpotsController>(
      () => AdminSpotsController(),
    );
  }
}

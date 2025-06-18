import 'package:get/get.dart';

import '../controllers/admin_driver_fares_controller.dart';

class AdminDriverFaresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDriverFaresController>(
      () => AdminDriverFaresController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/admin_spot_types_controller.dart';

class AdminSpotTypesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSpotTypesController>(
      () => AdminSpotTypesController(),
    );
  }
}

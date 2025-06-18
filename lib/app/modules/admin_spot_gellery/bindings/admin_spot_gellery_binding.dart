import 'package:get/get.dart';

import '../controllers/admin_spot_gellery_controller.dart';

class AdminSpotGelleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSpotGelleryController>(
      () => AdminSpotGelleryController(),
    );
  }
}

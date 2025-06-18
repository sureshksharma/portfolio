import 'package:get/get.dart';

import '../controllers/admin_product_tnc_controller.dart';

class AdminProductTncBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProductTncController>(
      () => AdminProductTncController(),
    );
  }
}

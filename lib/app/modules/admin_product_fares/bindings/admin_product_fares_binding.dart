import 'package:get/get.dart';

import '../controllers/admin_product_fares_controller.dart';

class AdminProductFaresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProductFaresController>(
      () => AdminProductFaresController(),
    );
  }
}

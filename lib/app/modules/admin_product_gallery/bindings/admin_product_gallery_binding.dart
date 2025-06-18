import 'package:get/get.dart';

import '../controllers/admin_product_gallery_controller.dart';

class AdminProductGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProductGalleryController>(
      () => AdminProductGalleryController(),
    );
  }
}

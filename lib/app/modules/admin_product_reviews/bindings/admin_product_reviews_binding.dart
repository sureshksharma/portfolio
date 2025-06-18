import 'package:get/get.dart';

import '../controllers/admin_product_reviews_controller.dart';

class AdminProductReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProductReviewsController>(
      () => AdminProductReviewsController(),
    );
  }
}

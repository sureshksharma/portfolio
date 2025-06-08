import 'package:get/get.dart';

import '../controllers/admin_sub_categories_controller.dart';

class AdminSubCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSubCategoriesController>(
      () => AdminSubCategoriesController(),
    );
  }
}

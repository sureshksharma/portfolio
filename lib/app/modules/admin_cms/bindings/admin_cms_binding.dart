import 'package:get/get.dart';

import '../controllers/admin_cms_controller.dart';

class AdminCmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCmsController>(
      () => AdminCmsController(),
    );
  }
}

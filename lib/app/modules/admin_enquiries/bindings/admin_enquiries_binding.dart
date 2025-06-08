import 'package:get/get.dart';

import '../controllers/admin_enquiries_controller.dart';

class AdminEnquiriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminEnquiriesController>(
      () => AdminEnquiriesController(),
    );
  }
}

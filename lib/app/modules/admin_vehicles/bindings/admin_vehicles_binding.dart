import 'package:get/get.dart';

import '../controllers/admin_vehicles_controller.dart';

class AdminVehiclesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminVehiclesController>(
      () => AdminVehiclesController(),
    );
  }
}

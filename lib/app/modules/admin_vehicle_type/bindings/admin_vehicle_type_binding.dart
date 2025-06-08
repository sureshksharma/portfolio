import 'package:get/get.dart';

import '../controllers/admin_vehicle_type_controller.dart';

class AdminVehicleTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminVehicleTypeController>(
      () => AdminVehicleTypeController(),
    );
  }
}

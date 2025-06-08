import 'package:get/get.dart';

import '../controllers/admin_vehicle_fare_controller.dart';

class AdminVehicleFareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminVehicleFareController>(
      () => AdminVehicleFareController(),
    );
  }
}

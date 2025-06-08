import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_vehicle_fare_controller.dart';

class AdminVehicleFareView extends GetView<AdminVehicleFareController> {
  const AdminVehicleFareView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminVehicleFareView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminVehicleFareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

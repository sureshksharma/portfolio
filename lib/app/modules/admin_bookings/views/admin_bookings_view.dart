import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/admin_main/admin_main.screen.dart';
import '../controllers/admin_bookings_controller.dart';

class AdminBookingsView extends GetView<AdminBookingsController> {
  const AdminBookingsView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdminMainScreen(
      child: const Center(
        child: Text(
          'AdminBookingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

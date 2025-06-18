import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_product_tnc_controller.dart';

class AdminProductTncView extends GetView<AdminProductTncController> {
  const AdminProductTncView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminProductTncView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminProductTncView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

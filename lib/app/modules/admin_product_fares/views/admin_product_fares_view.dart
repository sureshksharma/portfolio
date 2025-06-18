import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_product_fares_controller.dart';

class AdminProductFaresView extends GetView<AdminProductFaresController> {
  const AdminProductFaresView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminProductFaresView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminProductFaresView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

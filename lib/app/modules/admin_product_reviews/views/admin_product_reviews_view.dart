import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_product_reviews_controller.dart';

class AdminProductReviewsView extends GetView<AdminProductReviewsController> {
  const AdminProductReviewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminProductReviewsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminProductReviewsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

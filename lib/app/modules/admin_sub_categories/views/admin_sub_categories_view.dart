import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/admin_main/admin_main.screen.dart';
import '../controllers/admin_sub_categories_controller.dart';
import 'components/body.dart';

class AdminSubCategoriesView extends GetView<AdminSubCategoriesController> {
  const AdminSubCategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdminMainScreen(
      child: const AdminSubCategoriesBody(),
    );
  }
}

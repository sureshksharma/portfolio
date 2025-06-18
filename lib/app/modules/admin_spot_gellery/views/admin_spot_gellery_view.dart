import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/admin_main/admin_main.screen.dart';
import '../controllers/admin_spot_gellery_controller.dart';
import 'components/body.dart';

class AdminSpotGelleryView extends GetView<AdminSpotGelleryController> {
  const AdminSpotGelleryView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdminMainScreen(
      child: const AdminSpotGalleryBody(),
    );
  }
}

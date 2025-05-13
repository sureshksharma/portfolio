import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/main/main_screen.dart';
import '../controllers/unknown_controller.dart';

class UnknownView extends GetView<UnknownController> {
  const UnknownView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MainScreen(
      child: const Center(
        child: Text(
          'UnknownView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

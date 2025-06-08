import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../controllers/register_controller.dart';
import 'components/body.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const RegisterBody(),
    );
  }
}

import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';
import '../../../../../utils/responsive.dart';
import '../../controllers/menu_controller.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class MainScreen extends GetView<MenuController> {
  const MainScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            // Obx(
            //   () => controller.selectedIndex.value == 0
            //       ? HomeHeader()
            //       : Container(),
            // ),
            child,
            Footer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/responsive.dart';
import '../../../controllers/menu_controller.dart';

class SideMenu extends GetView<MenuController> {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.colorScheme.scrim,
        child: ListView(
          children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 3.5),
                child: SvgPicture.asset("assets/icons/logo_sqr.svg"),
              ),
            ),
            ...List.generate(
              controller.menuItems.length,
              (index) => Obx(
                () => DrawerItem(
                  isActive: index == controller.selectedIndex.value,
                  title: controller.menuItems[index],
                  press: () {
                    controller.setMenuIndex(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: isActive,
        selectedTileColor: theme.colorScheme.primary,
        onTap: press,
        title: Text(
          title,
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}

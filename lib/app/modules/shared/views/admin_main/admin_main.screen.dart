import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../controllers/admin_main.controller.dart';
import 'components/header.dart';
import 'components/drawer_menu.dart';

class AdminMainScreen extends GetView<AdminMainController> {
  const AdminMainScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Scaffold(
      drawer: Responsive.isMobile(context) ? DrawerMenu() : null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    constraints: BoxConstraints(maxWidth: kMaxWidth),
                    child: SafeArea(child: child),
                  ),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navigation Rail
                Container(
                  color: theme.colorScheme.scrim,
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: SizeConfig.defaultSize * 5,
                          maxHeight: SizeConfig.defaultSize * 3,
                        ),
                        child: Obx(
                          () => controller.isSideBarExtended.value
                              ? SvgPicture.asset(
                                  "assets/icons/logo_wide.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/icons/logo_sqr.svg",
                                ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Expanded(
                        child: Obx(
                          () => NavigationRail(
                            extended: controller.isSideBarExtended.value,
                            minExtendedWidth: SizeConfig.defaultSize * 15,
                            useIndicator: true,
                            labelType: NavigationRailLabelType.none,
                            selectedIndex: controller.selectedIndex.value,
                            onDestinationSelected: controller.setMenuIndex,
                            backgroundColor: theme.colorScheme.scrim,
                            destinations: controller.menuItems
                                .map(
                                  (i) => NavigationRailDestination(
                                    icon: Icon(Icons.apps),
                                    label: Text(
                                      i,
                                      style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 2,
                  color: theme.colorScheme.outline,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Header(),
                        Container(
                          padding: EdgeInsets.all(kDefaultPadding),
                          constraints: BoxConstraints(maxWidth: kMaxWidth),
                          child: SafeArea(child: child),
                        ),
                        // Footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

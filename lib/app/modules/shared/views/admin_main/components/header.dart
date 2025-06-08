import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/admin_main.controller.dart';

import '../../../../../../utils/responsive.dart';
import '../../main/components/network_image.widget.dart';

class Header extends GetView<AdminMainController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Container(
      width: double.infinity,
      color: theme.colorScheme.scrim,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 2, color: theme.colorScheme.outline),
                ),
              ),
              child: Row(
                children: [
                  if (Responsive.isMobile(context))
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: theme.colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        if (Scaffold.of(context).isDrawerOpen) {
                          Scaffold.of(context).closeDrawer();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                    )
                  else
                    InkWell(
                      onTap: controller.isSideBarExtended.toggle,
                      child: SvgPicture.asset(
                        'assets/icons/dock_to_righ.svg',
                        height: SizeConfig.defaultSize * 2,
                        width: SizeConfig.defaultSize * 2,
                      ),
                    ),
                  Spacer(),
                  // Admin Avatar
                  InkWell(
                    onTap: () => Get.rootDelegate.toNamed(Routes.ADMIN_PROFILE),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      child: Obx(
                        () => UserNetworkAvatar(
                          controller.currentUser.value?.avatar,
                          height: SizeConfig.defaultSize * 3,
                          width: SizeConfig.defaultSize * 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

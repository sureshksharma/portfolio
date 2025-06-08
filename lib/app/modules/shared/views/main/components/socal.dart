import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/responsive.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/menu_controller.dart';

class Socal extends GetView<MenuController> {
  const Socal({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          InkWell(
            onTap: () {},
            onHover: (value) {
              controller.headerSocialIconHover.value = value ? 0 : null;
            },
            child: Obx(
              () => SvgPicture.asset(
                "assets/icons/behance-alt.svg",
                colorFilter: ColorFilter.mode(
                  controller.headerSocialIconHover.value == 0
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize / 2),
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                controller.headerSocialIconHover.value = value ? 1 : null;
              },
              child: Obx(
                () => SvgPicture.asset(
                  "assets/icons/feather_dribbble.svg",
                  colorFilter: ColorFilter.mode(
                    controller.headerSocialIconHover.value == 1
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          InkWell(
            onTap: () {
              Get.rootDelegate.toNamed(Routes.LOGIN);
            },
            onHover: (value) {
              controller.headerSocialIconHover.value = value ? 2 : null;
            },
            child: Obx(
              () => Icon(
                controller.headerSocialIconHover.value == 2
                    ? Icons.account_circle_rounded
                    : Icons.account_circle_outlined,
                color: controller.headerSocialIconHover.value == 2
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onPrimary,
                size: 30,
              ),
            ),
          ),
        SizedBox(width: SizeConfig.defaultSize * 0.5),
        ElevatedButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize,
              vertical: SizeConfig.defaultSize /
                  (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text("Let's Talk"),
        ),
      ],
    );
  }
}

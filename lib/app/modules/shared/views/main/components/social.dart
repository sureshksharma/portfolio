import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../utils/responsive.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/menu_controller.dart';

class Social extends GetView<MenuController> {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          InkWell(
            onTap: () {
              launchUrlString(
                  'https://www.facebook.com/share/16nukzUJ23/?mibextid=wwXIfr');
            },
            onHover: (value) {
              controller.headerSocialIconHover.value = value ? 0 : null;
            },
            child: Obx(
              () => SvgPicture.asset(
                "assets/icons/facebook.svg",
                height: 24,
                width: 24,
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
              onTap: () {
                launchUrlString(
                    'https://www.instagram.com/tvaritcabs/profilecard/?igsh=MXhtMnZoOThlOTF6dA==');
              },
              onHover: (value) {
                controller.headerSocialIconHover.value = value ? 1 : null;
              },
              child: Obx(
                () => SvgPicture.asset(
                  "assets/icons/instagram.svg",
                  height: 24,
                  width: 24,
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
          onPressed: () {
            launchUrlString('tel://+917688992414');
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize,
              vertical: SizeConfig.defaultSize /
                  (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text("📞 Let's Talk"),
        ),
      ],
    );
  }
}

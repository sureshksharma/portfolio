import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controllers/menu_controller.dart';

import '../../../../../../utils/responsive.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends GetView<MenuController> {
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
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (Scaffold.of(context).isDrawerOpen) {
                              Scaffold.of(context).closeDrawer();
                            } else {
                              Scaffold.of(context).openDrawer();
                            }
                          },
                        ),
                      SvgPicture.asset(
                        "assets/icons/logo_wide.svg",
                        width: SizeConfig.defaultSize * 12.5,
                        height: SizeConfig.defaultSize * 2.6,
                      ),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      // Socal
                      const Socal(),
                    ],
                  ),
                  Obx(
                    () => controller.selectedIndex.value != 0
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: kDefaultPadding * 2),
                              Animate(
                                onComplete: (controller) => controller.repeat(),
                                effects: [
                                  CustomEffect(
                                    builder: (_, value, __) {
                                      int charactersToShow =
                                          ('Welcome to Tvarit Cabs '.length *
                                                  value)
                                              .clamp(
                                                  0,
                                                  'Welcome to Tvarit Cabs '
                                                      .length)
                                              .toInt();
                                      String visibleText =
                                          'Welcome to Tvarit Cabs '
                                              .substring(0, charactersToShow);
                                      return Text(
                                        visibleText,
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          color: theme.colorScheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                    duration: 2000.ms,
                                    delay: 500.ms,
                                    curve: Curves.ease,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding),
                                child: Text(
                                  "Tvarit Cabs® - Award winning Cab & Taxi service provider.",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                )
                                    .animate()
                                    .fade(delay: 2000.ms, duration: 2000.ms),
                              ),
                              if (controller.selectedIndex.value != 2)
                                FittedBox(
                                  child: TextButton(
                                    onPressed: () => controller.setMenuIndex(2),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Learn More",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: kDefaultPadding / 2),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (Responsive.isDesktop(context))
                                SizedBox(height: kDefaultPadding),
                            ],
                          )
                        : Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

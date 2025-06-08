import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controllers/menu_controller.dart';

import '../../../../../../utils/responsive.dart';

class Footer extends GetView<MenuController> {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Container(
      width: double.infinity,
      color: theme.colorScheme.outline,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              runSpacing: SizeConfig.defaultSize,
              alignment: Responsive.isDesktop(context)
                  ? WrapAlignment.spaceEvenly
                  : WrapAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize),
                  constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context)
                          ? SizeConfig.screenWidth / 4
                          : Responsive.isTablet(context)
                              ? SizeConfig.screenWidth / 2
                              : SizeConfig.screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'HEAD OFFICE',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize),
                      Text(
                        'Address: 24 Gopi Nagar Vistar, Jaisinghpura Khor Delhi Bypass Jaipur, Rajasthan 302027',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Phone: +91 9983010250',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        'rajputanacabsindia@gmail.com',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize),
                  constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context)
                          ? SizeConfig.screenWidth / 4
                          : Responsive.isTablet(context)
                              ? SizeConfig.screenWidth / 2
                              : SizeConfig.screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'OUR TAXI SERVICES',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize),
                      Text(
                        'Jaipur',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Jodhpur',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Udaipur',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Ajmer',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize),
                  constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context)
                          ? SizeConfig.screenWidth / 4
                          : Responsive.isTablet(context)
                              ? SizeConfig.screenWidth / 2
                              : SizeConfig.screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'POPULAR TOURS',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize),
                      Text(
                        'Rajasthan Car Rental',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Ranthambore Safari Booking',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Jaisalmer Desert Safari',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize / 2),
                      Text(
                        'Jaisalmer Tourism Packages',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize),
                  constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context)
                          ? SizeConfig.screenWidth / 4
                          : Responsive.isTablet(context)
                              ? SizeConfig.screenWidth / 2
                              : SizeConfig.screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'WELCOME TO RAJASTHAN',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.defaultSize,
                          right: SizeConfig.defaultSize,
                        ),
                        child: Image.asset(
                          'assets/images/2.png',
                          height: SizeConfig.defaultSize * 10,
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: theme.colorScheme.scrim,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize,
                vertical: SizeConfig.defaultSize * 2,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: SizeConfig.defaultSize,
                runSpacing: SizeConfig.defaultSize,
                children: [
                  Text(
                    '© Copyright 2023 | Tvarit Cabs® | All Rights Reserved.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      controller.footerSocialIconHover.value = value ? 0 : null;
                    },
                    child: Obx(
                      () => SvgPicture.asset(
                        "assets/icons/behance-alt.svg",
                        colorFilter: ColorFilter.mode(
                          controller.footerSocialIconHover.value == 0
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.outline,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      controller.footerSocialIconHover.value = value ? 1 : null;
                    },
                    child: Obx(
                      () => SvgPicture.asset(
                        "assets/icons/feather_dribbble.svg",
                        colorFilter: ColorFilter.mode(
                          controller.footerSocialIconHover.value == 1
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.outline,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      controller.footerSocialIconHover.value = value ? 2 : null;
                    },
                    child: Obx(
                      () => SvgPicture.asset(
                        "assets/icons/feather_twitter.svg",
                        colorFilter: ColorFilter.mode(
                          controller.footerSocialIconHover.value == 2
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.outline,
                          BlendMode.srcIn,
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

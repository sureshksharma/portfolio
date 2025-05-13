import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../../shared/views/main/components/network_image.widget.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key, this.image, required this.title, required this.subTitle});
  final String? image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return SizedBox(
      width: Responsive.isMobile(context)
          ? SizeConfig.screenWidth
          : Responsive.isTablet(context)
              ? SizeConfig.screenWidth * 0.4
              : SizeConfig.screenWidth * 0.2,
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NetworkImageWidget(image),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    subTitle,
                    textAlign: TextAlign.justify,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: theme.colorScheme.tertiary,
                    ),
                    child: Text(
                      'VIEW DETAILS',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
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

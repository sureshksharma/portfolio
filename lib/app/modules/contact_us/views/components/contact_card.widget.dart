import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Responsive.isMobile(context)
              ? double.infinity
              : SizeConfig.screenWidth / 4,
          padding: EdgeInsets.all(SizeConfig.defaultSize * 1.5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.colorScheme.secondary,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.secondary,
            size: SizeConfig.defaultSize * 3,
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize),
        Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

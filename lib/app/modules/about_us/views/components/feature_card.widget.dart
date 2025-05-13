import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';

class FeatureCardWidget extends StatefulWidget {
  const FeatureCardWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  State<FeatureCardWidget> createState() => _FeatureCardWidgetState();
}

class _FeatureCardWidgetState extends State<FeatureCardWidget> {
  ValueNotifier<bool> showMore = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Container(
      width: Responsive.isMobile(context)
          ? double.infinity
          : SizeConfig.screenWidth / 4,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize,
        vertical: SizeConfig.defaultSize * 2,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: theme.colorScheme.secondary, width: 2),
      ),
      child: Column(
        children: [
          Icon(
            widget.icon,
            size: SizeConfig.defaultSize * 3,
            color: theme.colorScheme.secondary,
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Text(
            widget.title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize),
          ValueListenableBuilder(
              valueListenable: showMore,
              builder: (_, shouldShow, __) {
                return Wrap(
                  children: [
                    Text(
                      widget.subTitle,
                      textAlign: TextAlign.justify,
                      maxLines: shouldShow ? 10 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        showMore.value = !showMore.value;
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        !shouldShow ? 'read more' : 'show less',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

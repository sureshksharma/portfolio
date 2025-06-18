import 'dart:math';

import 'package:cabservice/utils/double.extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../controllers/admin_product_gallery_controller.dart';

class ExpansionCard extends GetView<AdminProductGalleryController> {
  const ExpansionCard({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Card(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  if (controller.expandedIndex.value != index) {
                    controller.expandedIndex.value = index;
                  } else {
                    controller.expandedIndex.value = null;
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize),
                  child: Row(
                    children: [
                      Flexible(
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Product - ${index + 1} Gallery',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const VerticalDivider(),
                              Text(
                                'Title',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const VerticalDivider(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: SizeConfig.defaultSize * 0.5,
                                ),
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(),
                                  color: index == 1
                                      ? MaterialTheme.colorGreen
                                      : theme.colorScheme.errorContainer,
                                ),
                                child: Text(
                                  index == 1 ? 'Available' : 'Unavailable',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        controller.expandedIndex.value == index
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: SizeConfig.defaultSize * 3,
                        color: theme.colorScheme.scrim,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (controller.expandedIndex.value == index)
              Card(
                margin: EdgeInsets.all(SizeConfig.defaultSize),
                color: theme.colorScheme.scrim.withAlpha(0.1.toAlpha()),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize * 0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          Random().nextInt(10) + 5,
                          (ind) => Card(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              height: SizeConfig.defaultSize * 10,
                              width: SizeConfig.defaultSize * 10,
                              color: Color((Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                                  .withAlpha(255),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize),
                      Text(
                        'Description:',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Flexible(
                        child: Text(
                          'Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description. Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description. Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description. Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description. Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description. Looo ooooo oooo oooo ooooo oooooo ooo nnn nnnn nnnnnnnn nnnnnn nnnnnnnnn gggggg ggggg gg gg g gg g g g description.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:cabservice/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/admin_spot_types_controller.dart';

class AddVehicleTypeDialog extends GetView<AdminSpotTypesController> {
  const AddVehicleTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Spot Type'),
      titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      actions: [
        OutlinedButton(
          onPressed: Get.back,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
            side: BorderSide(
              color: theme.colorScheme.primary,
            ),
          ),
          child: Text(
            'Cancel',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: controller.createType,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Spot Type',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
      content: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Fill in the details for the new spot type.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            SizedBox(height: SizeConfig.defaultSize),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    'Name',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: kDefaultFontSize),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: controller.nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validateName,
                    decoration: InputDecoration(
                      hintText: 'e.g. Viewpoint',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.colorScheme.outline),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize),
                      ),
                      filled: true,
                      fillColor:
                          theme.colorScheme.outlineVariant.withAlpha(100),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize),
          ],
        ),
      ),
    );
  }
}

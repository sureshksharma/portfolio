import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/admin/driver.model.dart';
import '../../../../domain/admin/type.model.dart';
import '../../controllers/admin_driver_fares_controller.dart';

class AddDriverFareDialog extends GetView<AdminDriverFaresController> {
  const AddDriverFareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Vehicle Fare'),
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
          onPressed: controller.createFare,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Vehicle Fare',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
      content: Obx(
        () => FutureBuilder(
            future: controller.futureDialog.value,
            builder: (context, snapshot) {
              return Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Fill in the details for the new vehicle fare.",
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
                            'Type',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: Obx(
                            () => DropdownButtonFormField2<DriverModel>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                filled: true,
                                fillColor: theme.colorScheme.outlineVariant
                                    .withAlpha(100),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.outline),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.defaultSize),
                                ),
                              ),
                              hint: Text(
                                'Select driver',
                                style: theme.textTheme.bodyMedium,
                              ),
                              items: controller.drivers
                                  .map(
                                    (item) => DropdownMenuItem<DriverModel>(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              validator: controller.validateDriver,
                              onChanged: controller.selectedDriver.call,
                              value: controller.selectedDriver.value,
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: theme.colorScheme.outline,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Type',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: Obx(
                            () => DropdownButtonFormField2<TypeModel>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                filled: true,
                                fillColor: theme.colorScheme.outlineVariant
                                    .withAlpha(100),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.outline),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.defaultSize),
                                ),
                              ),
                              hint: Text(
                                'Select fare type',
                                style: theme.textTheme.bodyMedium,
                              ),
                              items: controller.fareTypes
                                  .map(
                                    (item) => DropdownMenuItem<TypeModel>(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              validator: controller.validateType,
                              onChanged: controller.selectedFareType.call,
                              value: controller.selectedFareType.value,
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: theme.colorScheme.outline,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Fare',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: controller.fareController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validatFare,
                            decoration: InputDecoration(
                              hintText: 'e.g. 15',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Status',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonFormField2<int>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                            ),
                            hint: Text(
                              'Select vehicle fare status',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: [0, 1]
                                .map((item) => DropdownMenuItem<int>(
                                      value: item,
                                      child: Text(
                                        switch (item) {
                                          0 => 'Inactive',
                                          _ => 'Active',
                                        },
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: controller.validateStatus,
                            onChanged: controller.selectedStatus.call,
                            value: controller.selectedStatus.value,
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: theme.colorScheme.outline,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

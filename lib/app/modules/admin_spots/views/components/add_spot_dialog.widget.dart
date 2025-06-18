import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/admin/city.model.dart';
import '../../../../domain/admin/state.model.dart';
import '../../../../domain/admin/type.model.dart';
import '../../controllers/admin_spots_controller.dart';

class AddSpotDialog extends GetView<AdminSpotsController> {
  const AddSpotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Spot'),
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
          onPressed: controller.createSpot,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Spot',
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
                    "Fill in the details below to add a new spot. Click save when you're done.",
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
                            hintText: 'e.g. Hawa Mahal',
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
                              'Select spot type',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: controller.spotTypes
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
                            onChanged: controller.selectedSpotType.call,
                            value: controller.selectedSpotType.value,
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
                          'Location',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.locationController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.validateLocation,
                          decoration: InputDecoration(
                            hintText: 'e.g. Jaipur City Center',
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'Latitude',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.latController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.validateLat,
                          decoration: InputDecoration(
                            hintText: 'e.g. 20.232353',
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'Longitude',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.longController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.validateLong,
                          decoration: InputDecoration(
                            hintText: 'e.g. 73.232353',
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'State',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: Obx(
                          () => DropdownButtonFormField2<StateModel>(
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
                              'Select spot state',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: controller.states
                                .map(
                                  (item) => DropdownMenuItem<StateModel>(
                                    value: item,
                                    child: Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: controller.validateState,
                            onChanged:(value) async {
                              controller.selectedState.value = value;
                              await controller.fetchCities();
                            },
                            value: controller.selectedState.value,
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
                          'City',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: Obx(
                          () => DropdownButtonFormField2<CityModel>(
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
                              'Select spot city',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: controller.cites
                                .map(
                                  (item) => DropdownMenuItem<CityModel>(
                                    value: item,
                                    child: Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: controller.validateCity,
                            onChanged: controller.selectedCity.call,
                            value: controller.selectedCity.value,
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
                          'Description',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.descController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.validateDesc,
                          decoration: InputDecoration(
                            hintText: 'e.g. Briefly describe the spot',
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
                            fillColor:
                                theme.colorScheme.outlineVariant.withAlpha(100),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: theme.colorScheme.outline),
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.defaultSize),
                            ),
                          ),
                          hint: Text(
                            'Select spot status',
                            style: theme.textTheme.bodyMedium,
                          ),
                          items: [0, 1]
                              .map((item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: Text(
                                      switch (item) {
                                        0 => 'Inactive',
                                        _ => 'Active'
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'Image',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: kDefaultFontSize),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: controller.pickImage,
                          child: Obx(
                            () => Container(
                              padding:
                                  controller.selectedImageBytes.value == null
                                      ? EdgeInsets.all(kDefaultPadding / 2)
                                      : null,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: theme.colorScheme.outline),
                              ),
                              child: controller.selectedImageBytes.value == null
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.photo,
                                          color: theme.colorScheme.primary,
                                        ),
                                        Text(
                                          'Select spot image',
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: theme.colorScheme.outline,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Image.memory(
                                      controller.selectedImageBytes.value!,
                                      height: Responsive.isMobile(context)
                                          ? SizeConfig.defaultSize * 8
                                          : SizeConfig.defaultSize * 4,
                                      width: Responsive.isMobile(context)
                                          ? SizeConfig.defaultSize * 8
                                          : SizeConfig.defaultSize * 4,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/admin/category.model.dart';
import '../../controllers/admin_sub_categories_controller.dart';

class AddSubCategoryDialog extends GetView<AdminSubCategoriesController> {
  const AddSubCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Subcategory'),
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
          onPressed: controller.createSubcategory,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Subcategory',
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
                      "Fill in the details for the new subcategory.",
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validateName,
                            decoration: InputDecoration(
                              hintText: 'e.g. City Cabs',
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
                            'Parent Category',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: Obx(
                            () => DropdownButtonFormField2<CategoryModel>(
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
                                'Select parent category',
                                style: theme.textTheme.bodyMedium,
                              ),
                              items: controller.categories
                                  .map(
                                      (item) => DropdownMenuItem<CategoryModel>(
                                            value: item,
                                            child: Text(
                                              item.name ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              validator: controller.validateCategory,
                              onChanged: controller.selectedCategory.call,
                              value: controller.selectedCategory.value,
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validateDesc,
                            decoration: InputDecoration(
                              hintText: 'Briefly describe the subcategory',
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
                          child: Obx(
                            () => DropdownButtonFormField2<int>(
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
                                'Select subcategory status',
                                style: theme.textTheme.bodyMedium,
                              ),
                              items: [1, 0]
                                  .map((item) => DropdownMenuItem<int>(
                                        value: item,
                                        child: Text(
                                          item == 1 ? 'Active' : 'Inactive',
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

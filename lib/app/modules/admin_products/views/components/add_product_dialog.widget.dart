import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/admin/subcategory.model.dart';
import '../../../../domain/admin/type.model.dart';
import '../../controllers/admin_products_controller.dart';

class AddProductDialog extends GetView<AdminProductsController> {
  const AddProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Product'),
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
          onPressed: controller.createProduct,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Product',
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
                      "Fill in the details for the new product or service.",
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
                              hintText: 'e.g. Jaipur City Sightseeing',
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
                          child: DropdownButtonFormField2<SubcategoryModel>(
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
                            items: controller.productCategories
                                .map((item) =>
                                    DropdownMenuItem<SubcategoryModel>(
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
                            onChanged: controller.selectedProductCategory.call,
                            value: controller.selectedProductCategory.value,
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
                            'Product Type',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonFormField2<TypeModel>(
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
                              'Select product type',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: controller.productTypes
                                .map((item) => DropdownMenuItem<TypeModel>(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: controller.validateType,
                            onChanged: controller.selectedProductType.call,
                            value: controller.selectedProductType.value,
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
                              hintText: 'Briefly describe the product/service',
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
                              'Select product status',
                              style: theme.textTheme.bodyMedium,
                            ),
                            items: [0, 1, 2]
                                .map((item) => DropdownMenuItem<int>(
                                      value: item,
                                      child: Text(
                                        item == 0
                                            ? 'Unavailable'
                                            : item == 1
                                                ? 'Available'
                                                : 'Draft',
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
                                child: controller.selectedImageBytes.value ==
                                        null
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.photo,
                                            color: theme.colorScheme.primary,
                                          ),
                                          Text(
                                            'Select product image',
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
            }),
      ),
    );
  }
}

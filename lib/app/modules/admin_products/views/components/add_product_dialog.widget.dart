import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          onPressed: Get.back,
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
      content: Column(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'e.g. Jaipur City Sightseeing',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                  ),
                  hint: Text(
                    'Select parent category',
                    style: theme.textTheme.bodyMedium,
                  ),
                  items: ['Transportation', 'Tours', 'Packages']
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select parent category.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: controller.selectedCategory.call,
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
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'Subcategory',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                  ),
                  hint: Text(
                    'Select subcategory',
                    style: theme.textTheme.bodyMedium,
                  ),
                  items: [
                    'Jaipur City Taxi',
                    'Outstation (One Way)',
                    'Outstation (Round Trip)',
                    'Tempo Traveller Rental'
                  ]
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select subcategory.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: controller.selectedCategory.call,
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
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'Price',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'e.g. ₹2500.00',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                  'Duration',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'e.g. 8 Hours or 2D/1N',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                  'Vehicle Type',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                  ),
                  hint: Text(
                    'Select vehicle type (optional)',
                    style: theme.textTheme.bodyMedium,
                  ),
                  items: ['Sedan', 'SUV', 'Tempo Traveller', 'Bus']
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    //
                  },
                  onSaved: controller.selectedCategory.call,
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
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'Capacity',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'e.g. 4 (passengers)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'Briefly describe the product/service',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                  'Itinerary',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: kDefaultFontSize),
              Expanded(
                flex: 3,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'Detailed itinerary (for tours)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
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
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                  ),
                  hint: Text(
                    'Select driver status',
                    style: theme.textTheme.bodyMedium,
                  ),
                  items: ['Draft', 'Available', 'Unavailable']
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select status.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: controller.selectedStatus.call,
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: null,
                  decoration: InputDecoration(
                    hintText: 'Select product image',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.outline),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
        ],
      ),
    );
  }
}

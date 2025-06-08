import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../shared/views/main/components/network_image.widget.dart';
import '../../controllers/admin_products_controller.dart';
import 'add_product_dialog.widget.dart';

class AdminProductsBody extends GetView<AdminProductsController> {
  const AdminProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return SafeArea(
      minimum: EdgeInsets.all(SizeConfig.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddProductDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize,
                    vertical: SizeConfig.defaultSize,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: theme.colorScheme.onPrimary,
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Text(
                      'Add New Product',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Card(
            color: theme.colorScheme.onPrimary,
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Products & Services',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage all bookable items offered.',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  // Table Header
                  DataTable(
                    headingTextStyle: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    dataRowMaxHeight: kMinInteractiveDimension * 2,
                    columns: [
                      DataColumn(
                        label: Text('Image'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Category'),
                      ),
                      DataColumn(
                        label: Text('Subcategory'),
                      ),
                      DataColumn(
                        label: Text('Type'),
                      ),
                      DataColumn(
                        label: Text('Price'),
                      ),
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            NetworkImageWidget(
                              null,
                              height: SizeConfig.defaultSize * 3,
                              width: SizeConfig.defaultSize * 3,
                            ),
                          ),
                          DataCell(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'Jaipur Full Day City Sightseeing (Sedan)'),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: kMinInteractiveDimension / 4,
                                      color: theme.colorScheme.outlineVariant,
                                    ),
                                    Text(
                                      '8 Hours',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        color: theme.colorScheme.outlineVariant,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: kMinInteractiveDimension / 4,
                                      color: theme.colorScheme.outlineVariant,
                                    ),
                                    Text(
                                      '4 pax',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        color: theme.colorScheme.outlineVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Text('Transportation'),
                          ),
                          DataCell(
                            Text('Jaipur City Taxi'),
                          ),
                          DataCell(
                            Text('₹2500.00'),
                          ),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: SizeConfig.defaultSize * 0.5,
                              ),
                              decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: MaterialTheme.colorGreen,
                              ),
                              child: Text(
                                'Active',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text('5')),
                          DataCell(
                            showPopupActions(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showPopupActions() {
    final theme = Get.theme;
    return PopupMenuButton(
      color: theme.colorScheme.onPrimary,
      icon: Icon(Icons.more_horiz),
      iconColor: theme.colorScheme.scrim,
      tooltip: 'View Actions',
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          enabled: false,
          labelTextStyle:
              WidgetStateProperty.all(theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          )),
          child: Text('Actions'),
        ),
        PopupMenuItem(
          value: 1,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('View'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.edit_note,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Edit'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.delete_outline,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Delete'),
            ],
          ),
        ),
      ],
    );
  }
}

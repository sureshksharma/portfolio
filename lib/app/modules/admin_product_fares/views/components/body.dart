import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../controllers/admin_product_fares_controller.dart';
import 'add_product_fare_dialog.widget.dart';

class AdminProductFaresBody extends GetView<AdminProductFaresController> {
  const AdminProductFaresBody({super.key});

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
                'Product Fares Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.clearFields();
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddProductFareDialog(),
                  );
                  controller.futureDialog.value = Future.wait([
                    controller.fetchProducts(),
                    controller.fetchVehicles(),
                    controller.fetchFareTypes(),
                  ]);
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
                      'Add New Product Fare',
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
                    'All Product Fares',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage product fares.',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  // Table Header
                  Obx(
                    () => FutureBuilder(
                      future: controller.future.value,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            controller.fares.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Obx(
                              () => DataTable(
                                headingTextStyle:
                                    theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                columns: [
                                  DataColumn(
                                    label: Text('ID'),
                                  ),
                                  DataColumn(
                                    label: Text('Product'),
                                  ),
                                  DataColumn(
                                    label: Text('Duration'),
                                  ),
                                  DataColumn(
                                    label: Text('Vehicle'),
                                  ),
                                  DataColumn(
                                    label: Text('Fare Type'),
                                  ),
                                  DataColumn(
                                    label: Text('Fares'),
                                  ),
                                  DataColumn(
                                    label: Text('Status'),
                                  ),
                                  DataColumn(
                                    label: Text('Actions'),
                                  ),
                                ],
                                rows: controller.fares
                                    .map(
                                      (c) => DataRow(
                                        cells: [
                                          DataCell(
                                            Text(c.id?.toString() ?? ''),
                                          ),
                                          DataCell(
                                            Text(c.product?.name ?? ''),
                                          ),
                                          DataCell(
                                            Text(
                                                '${c.duration ?? 0} ${c.durationType ?? ''}'),
                                          ),
                                          DataCell(
                                            Text(
                                                '${c.vehicle?.make ?? ''} ${c.vehicle?.model ?? ''} (${c.vehicle?.year ?? ''})'),
                                          ),
                                          DataCell(
                                            Text(c.fareType?.name ?? ''),
                                          ),
                                          DataCell(
                                            Text(
                                                'Base Fare: ${c.baseFare?.toStringAsFixed(2) ?? ''}\nFinal Fare: ${c.finalFare?.toStringAsFixed(2) ?? ''}'),
                                          ),
                                          DataCell(
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                                horizontal:
                                                    SizeConfig.defaultSize *
                                                        0.5,
                                              ),
                                              decoration: ShapeDecoration(
                                                shape: StadiumBorder(),
                                                color: c.status == 1
                                                    ? MaterialTheme.colorGreen
                                                    : theme.colorScheme
                                                        .errorContainer,
                                              ),
                                              child: Text(
                                                c.status == 1
                                                    ? 'Active'
                                                    : 'Inactive',
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  color: theme
                                                      .colorScheme.onPrimary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            showPopupActions(),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            controller.fares.isEmpty) {
                          return Center(
                            child: Text(
                                'Product fares not available. Please add product fares.'),
                          );
                        } else {
                          return Center(
                            child: Text('Please wait...'),
                          );
                        }
                      },
                    ),
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

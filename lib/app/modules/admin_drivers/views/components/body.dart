import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/admin_drivers_controller.dart';
import 'add_driver_dialog.widget.dart';

class AdminDriversBody extends GetView<AdminDriversController> {
  const AdminDriversBody({super.key});

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
                'Driver Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddDriverDialog(),
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
                      'Add New Driver',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
              PopupMenuButton(
                color: theme.colorScheme.onPrimary,
                icon: Icon(Icons.more_horiz),
                iconColor: theme.colorScheme.scrim,
                tooltip: 'More Actions',
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      Get.rootDelegate.toNamed(Routes.ADMIN_DRIVER_FARES);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    enabled: false,
                    labelTextStyle: WidgetStateProperty.all(
                      theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('More Actions'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    labelTextStyle:
                        WidgetStateProperty.all(theme.textTheme.bodySmall),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Driver Fares'),
                      ],
                    ),
                  ),
                ],
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
                    'Driver Profiles',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage driver profiles, availability, and performance.',
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
                            controller.drivers.isNotEmpty) {
                          return Obx(
                            () => DataTable(
                              headingTextStyle:
                                  theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              columns: [
                                DataColumn(
                                  label: Text('Driver ID'),
                                ),
                                DataColumn(
                                  label: Text('Name'),
                                ),
                                DataColumn(
                                  label: Text('License No.'),
                                ),
                                DataColumn(
                                  label: Text('Status'),
                                ),
                                // DataColumn(
                                //   label: Text('Rating'),
                                // ),
                                DataColumn(
                                  label: Text('Actions'),
                                ),
                              ],
                              rows: controller.drivers
                                  .map(
                                    (d) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                              'DRV${d.id.toString().padLeft(3, '0')}'),
                                        ),
                                        DataCell(
                                          Text(d.name ?? ''),
                                        ),
                                        DataCell(
                                          Text(d.licenseNo ?? ''),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2,
                                              horizontal:
                                                  SizeConfig.defaultSize * 0.5,
                                            ),
                                            decoration: ShapeDecoration(
                                              shape: StadiumBorder(),
                                              color: d.status == 1
                                                  ? MaterialTheme.colorGreen
                                                  : theme.colorScheme
                                                      .errorContainer,
                                            ),
                                            child: Text(
                                              d.status == 1
                                                  ? 'Active'
                                                  : 'Inactive',
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // DataCell(
                                        //   Row(
                                        //     children: [
                                        //       Text('4.8'),
                                        //       SizedBox(
                                        //           width: kDefaultPadding / 6),
                                        //       Icon(
                                        //         Icons.star,
                                        //         color: theme.colorScheme.scrim,
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        DataCell(
                                          showPopupActions(),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            controller.drivers.isEmpty) {
                          return Center(
                            child: Text(
                                'Drivers not available. Please add drivers.'),
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
              Text('View Detail'),
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
              Text('Edit Driver'),
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
              Text('Delete Driver'),
            ],
          ),
        ),
      ],
    );
  }
}

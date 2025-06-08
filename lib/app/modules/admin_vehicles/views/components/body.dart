import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/admin_vehicles_controller.dart';
import 'add_vehicle_dialog.widget.dart';

class AdminVehiclesBody extends GetView<AdminVehiclesController> {
  const AdminVehiclesBody({super.key});

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
            children: [
              Text(
                'Vehicle Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddVehicleDialog(),
                  );
                  if (controller.vehicleTypes.isEmpty) {
                    controller.futureDialog.value =
                        controller.fetchVehicleTypes();
                  }
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
                      'Add New Vehicle',
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
                      Get.rootDelegate.toNamed(Routes.ADMIN_VEHICLE_TYPE);
                    case 2:
                      Get.rootDelegate.toNamed(Routes.ADMIN_VEHICLE_FARE);
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
                          Icons.car_rental,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Vehicle Types'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    labelTextStyle:
                        WidgetStateProperty.all(theme.textTheme.bodySmall),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Vehicle Fares'),
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
                    'Vehicle Fleet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage and track all vehicles in your fleet.',
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
                            controller.vehicles.isNotEmpty) {
                          return Obx(
                            () => DataTable(
                              headingTextStyle:
                                  theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              columns: [
                                DataColumn(
                                  label: Text('Vehicle ID'),
                                ),
                                DataColumn(
                                  label: Text('Make & Model'),
                                ),
                                DataColumn(
                                  label: Text('Type'),
                                ),
                                DataColumn(
                                  label: Text('Capacity'),
                                ),
                                DataColumn(
                                  label: Text('License Plate'),
                                ),
                                DataColumn(
                                  label: Text('Status'),
                                ),
                                DataColumn(
                                  label: Text('Actions'),
                                ),
                              ],
                              rows: controller.vehicles
                                  .map(
                                    (v) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                              'V${v.id.toString().padLeft(3, '0')}'),
                                        ),
                                        DataCell(
                                          Text(
                                              '${v.make ?? ''} ${v.model ?? ''} (${v.year ?? 0})'),
                                        ),
                                        DataCell(
                                          Text(v.type?.name ?? ''),
                                        ),
                                        DataCell(
                                          Text(v.capacity?.toString() ?? ''),
                                        ),
                                        DataCell(
                                          Text(v.licensePlate ?? ''),
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
                                              color: v.status == 1
                                                  ? MaterialTheme.colorGreen
                                                  : v.status == 2
                                                      ? MaterialTheme.colorBlue
                                                      : v.status == 3
                                                          ? MaterialTheme
                                                              .colorYellow
                                                          : theme.colorScheme
                                                              .errorContainer,
                                            ),
                                            child: Text(
                                              v.status == 1
                                                  ? 'Available'
                                                  : v.status == 2
                                                      ? 'In Use'
                                                      : v.status == 3
                                                          ? 'Maintenance'
                                                          : 'Unavailable',
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color:
                                                    theme.colorScheme.onPrimary,
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
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            controller.vehicles.isEmpty) {
                          return Center(
                            child: Text(
                                'Vehicles not available. Please add vehicles.'),
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
              Text('Edit Vehicle'),
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
              Text('Delete Vehicle'),
            ],
          ),
        ),
      ],
    );
  }
}

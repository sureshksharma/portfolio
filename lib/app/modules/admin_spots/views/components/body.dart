import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../../routes/app_pages.dart';
import '../../../shared/views/main/components/network_image.widget.dart';
import '../../controllers/admin_spots_controller.dart';
import 'add_spot_dialog.widget.dart';

class AdminSpotsBody extends GetView<AdminSpotsController> {
  const AdminSpotsBody({super.key});

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
                'Spot Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddSpotDialog(),
                  );
                  if (controller.spotTypes.isEmpty) {
                    controller.futureDialog.value = Future.wait([
                      controller.fetchSpotTypes(),
                      controller.fetchStates()
                    ]);
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
                      'Add New Spot',
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
                      Get.rootDelegate.toNamed(Routes.ADMIN_SPOT_TYPES);
                    case 2:
                      Get.rootDelegate.toNamed(Routes.ADMIN_SPOT_GELLERY);
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
                          Icons.menu,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Spot Types'),
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
                          Icons.photo,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Spot Gallery'),
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
                    'Spots',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage and track all spots in your tour packages.',
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
                            controller.spots.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Obx(
                              () => DataTable(
                                headingTextStyle:
                                    theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                dataRowMaxHeight: SizeConfig.defaultSize * 6,
                                columns: [
                                  DataColumn(
                                    label: Text('Spot ID'),
                                  ),
                                  DataColumn(
                                    label: Text('Spot'),
                                  ),
                                  DataColumn(
                                    label: Text('Type'),
                                  ),
                                  DataColumn(
                                    label: Text('Location'),
                                  ),
                                  DataColumn(
                                    label: Text('Coordinates'),
                                  ),
                                  DataColumn(
                                    label: Text('Description'),
                                  ),
                                  DataColumn(
                                    label: Text('City'),
                                  ),
                                  DataColumn(
                                    label: Text('Status'),
                                  ),
                                  DataColumn(
                                    label: Text('Actions'),
                                  ),
                                ],
                                rows: controller.spots
                                    .map(
                                      (s) => DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                                'S${s.id.toString().padLeft(3, '0')}'),
                                          ),
                                          DataCell(
                                            Wrap(
                                              spacing: kDefaultPadding / 4,
                                              runSpacing: kDefaultPadding / 4,
                                              children: [
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  height:
                                                      SizeConfig.defaultSize *
                                                          4,
                                                  width:
                                                      SizeConfig.screenWidth /
                                                          12,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    color: theme
                                                        .colorScheme.surface,
                                                    border: Border.all(
                                                      color: theme
                                                          .colorScheme.outline,
                                                    ),
                                                  ),
                                                  child: NetworkImageWidget(
                                                      s.image),
                                                ),
                                                Text(s.name ?? ''),
                                              ],
                                            ),
                                          ),
                                          DataCell(
                                            Text(s.type?.name ?? ''),
                                          ),
                                          DataCell(
                                            SizedBox(
                                              width: SizeConfig.screenWidth / 9,
                                              child: Text(s.location ?? ''),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              '${s.latitude ?? 0},\n${s.longitude ?? 0}',
                                            ),
                                          ),
                                          DataCell(
                                            SizedBox(
                                              width: SizeConfig.screenWidth / 9,
                                              child: Text(
                                                s.desc ?? '',
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(s.city?.title ?? ''),
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
                                                color: s.status == 1
                                                    ? MaterialTheme.colorGreen
                                                    : theme.colorScheme
                                                        .errorContainer,
                                              ),
                                              child: Text(
                                                s.status == 1
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
                            controller.spots.isEmpty) {
                          return Center(
                            child:
                                Text('Spots not available. Please add spots.'),
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
              Text('Edit Spot'),
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
              Text('Delete Spot'),
            ],
          ),
        ),
      ],
    );
  }
}

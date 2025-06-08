import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../shared/views/main/components/network_image.widget.dart';
import '../../controllers/admin_users_controller.dart';

class AdminUsersBody extends GetView<AdminUsersController> {
  const AdminUsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return SafeArea(
      minimum: EdgeInsets.all(SizeConfig.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Management',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
                    'User Accounts',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'View, edit, and manage user accounts for the TvaritCabs platform.',
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
                    columns: [
                      DataColumn(
                        label: Text('User ID'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Email'),
                      ),
                      DataColumn(
                        label: Text('Role'),
                      ),
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('Last Login'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text('USR001'),
                          ),
                          DataCell(
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.defaultSize * 0.5,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: theme.colorScheme.surface,
                                      border: Border.all(
                                        color: theme.colorScheme.outline,
                                      ),
                                    ),
                                    child: UserNetworkAvatar(
                                      null,
                                      height: SizeConfig.defaultSize * 2.5,
                                      width: SizeConfig.defaultSize * 2.5,
                                    ),
                                  ),
                                  SizedBox(width: kDefaultPadding / 4),
                                  Text('Admin User'),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Text('admin@travelpilot.com'),
                          ),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: SizeConfig.defaultSize * 0.5,
                              ),
                              decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: theme.colorScheme.errorContainer,
                              ),
                              child: Text('Admin',style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: SizeConfig.defaultSize * 0.5,
                              ),
                              decoration: ShapeDecoration(
                                color: MaterialTheme.colorGreen,
                                shape: StadiumBorder(),
                              ),
                              child: Text('Active',style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),),
                            ),
                          ),
                          DataCell(
                            Text('2024-07-28 10:00 AM'),
                          ),
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
              Text('Edit User'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Text('Block User'),
        ),
        PopupMenuItem(
          value: 2,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.delete_outline,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Delete User'),
            ],
          ),
        ),
      ],
    );
  }
}

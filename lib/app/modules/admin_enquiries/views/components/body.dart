import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../controllers/admin_enquiries_controller.dart';

class AdminEnquiriesBody extends GetView<AdminEnquiriesController> {
  const AdminEnquiriesBody({super.key});

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
            'User Enquiries',
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
                    'Enquiries',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'View user enquiries for the TvaritCabs platform.',
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
                        label: Text('Sr. No.'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Email'),
                      ),
                      DataColumn(
                        label: Text('Phone'),
                      ),
                      DataColumn(
                        label: Text('Enquiry Date'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text('1'),
                          ),
                          DataCell(
                            Text('Generic User'),
                          ),
                          DataCell(
                            Text('generic_user@mail.com'),
                          ),
                          DataCell(
                            Text('+91 9532525234'),
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
                Icons.call,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Call'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.call,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Email'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          labelTextStyle: WidgetStateProperty.all(theme.textTheme.bodySmall),
          child: Row(
            children: [
              Icon(
                Icons.delete_outline,
                color: theme.colorScheme.scrim,
              ),
              SizedBox(width: kDefaultPadding / 4),
              Text('Delete Enquiry'),
            ],
          ),
        ),
      ],
    );
  }
}

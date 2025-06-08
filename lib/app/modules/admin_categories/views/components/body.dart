import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../controllers/admin_categories_controller.dart';
import 'add_category_dialog.widget.dart';

class AdminCategoriesBody extends GetView<AdminCategoriesController> {
  const AdminCategoriesBody({super.key});

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
                'Category Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddCategoryDialog(),
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
                      'Add New Category',
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
                    'All Categories',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 0.5),
                  Text(
                    'Manage service and product categories.',
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
                            controller.categories.isNotEmpty) {
                          return Obx(
                            () => DataTable(
                              headingTextStyle:
                                  theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              columns: [
                                DataColumn(
                                  label: Text('Category ID'),
                                ),
                                DataColumn(
                                  label: Text('Name'),
                                ),
                                DataColumn(
                                  label: Text('Status'),
                                ),
                                DataColumn(
                                  label: Text('Subcategories'),
                                ),
                                DataColumn(
                                  label: Text('Actions'),
                                ),
                              ],
                              rows: controller.categories
                                  .map(
                                    (c) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                              'CAT${c.id.toString().padLeft(3, '0')}'),
                                        ),
                                        DataCell(
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(c.name ?? ''),
                                              Text(
                                                c.desc ?? '',
                                                style: theme
                                                    .textTheme.labelSmall
                                                    ?.copyWith(
                                                  color: theme.colorScheme
                                                      .outlineVariant,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                              color: c.status == 1
                                                  ? MaterialTheme.colorGreen
                                                  : theme.colorScheme.error,
                                            ),
                                            child: Text(
                                              c.status == 1
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
                                        DataCell(
                                            Text('${c.subcategories ?? 0}')),
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
                            controller.categories.isEmpty) {
                          return Center(
                            child: Text(
                                'Categories not available. Please add categories.'),
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

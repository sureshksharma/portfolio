import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../../utils/responsive.dart';
import '../../../../routes/app_pages.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Management',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AddProductDialog(),
                  );
                  if (controller.productCategories.isEmpty) {
                    controller.futureDialog.value = Future.wait([
                      controller.fetchProductCategories(),
                      controller.fetchProductTypes(),
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
                      'Add New Product',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: SizeConfig.defaultSize),
              PopupMenuButton(
                color: theme.colorScheme.onPrimary,
                icon: Icon(Icons.more_horiz),
                iconColor: theme.colorScheme.scrim,
                tooltip: 'More Actions',
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      Get.rootDelegate.toNamed(Routes.ADMIN_PRODUCT_GALLERY);
                      break;
                    case 2:
                      Get.rootDelegate.toNamed(Routes.ADMIN_PRODUCT_FARES);
                      break;
                    case 3:
                      Get.rootDelegate.toNamed(Routes.ADMIN_PRODUCT_TNC);
                      break;
                    case 4:
                      Get.rootDelegate.toNamed(Routes.ADMIN_PRODUCT_REVIEWS);
                      break;
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
                          Icons.photo,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Product Gallery'),
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
                        Text('Product Fares'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    labelTextStyle:
                        WidgetStateProperty.all(theme.textTheme.bodySmall),
                    child: Row(
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: theme.colorScheme.scrim,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Product TnC'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    labelTextStyle:
                        WidgetStateProperty.all(theme.textTheme.bodySmall),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: MaterialTheme.colorYellow,
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Text('Product Reviews'),
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
                  Obx(
                    () => FutureBuilder(
                      future: controller.future.value,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            controller.products.isNotEmpty) {
                          return Obx(
                            () => DataTable(
                              headingTextStyle:
                                  theme.textTheme.titleSmall?.copyWith(
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
                                  label: Text('Type'),
                                ),
                                DataColumn(
                                  label: Text('Description'),
                                ),
                                DataColumn(
                                  label: Text('Status'),
                                ),
                                DataColumn(
                                  label: Text('Actions'),
                                ),
                              ],
                              rows: controller.products
                                  .map(
                                    (p) => DataRow(
                                      cells: [
                                        DataCell(
                                          NetworkImageWidget(
                                            p.image,
                                            height: SizeConfig.defaultSize * 3,
                                            width: SizeConfig.defaultSize * 3,
                                          ),
                                        ),
                                        DataCell(
                                          Text(p.name ?? ''),
                                        ),
                                        DataCell(
                                          Text(p.category?.name ?? ''),
                                        ),
                                        DataCell(
                                          Text(p.type?.name ?? ''),
                                        ),
                                        DataCell(
                                          SizedBox(
                                            width: SizeConfig.screenWidth / 9,
                                            child: Text(p.desc ?? ''),
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
                                              color: p.status == 1
                                                  ? MaterialTheme.colorGreen
                                                  : p.status == 2
                                                      ? MaterialTheme
                                                          .colorYellow
                                                      : theme.colorScheme
                                                          .errorContainer,
                                            ),
                                            child: Text(
                                              p.status == 1
                                                  ? 'Available'
                                                  : p.status == 2
                                                      ? 'Draft'
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
                            controller.products.isEmpty) {
                          return Center(
                            child: Text(
                                'Products not available. Please add products.'),
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

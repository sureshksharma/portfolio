import 'package:get/get.dart';

import '../../../domain/auth/models/user.model.dart';
import '../../../routes/app_pages.dart';

class AdminMainController extends GetxController {
  Rxn<UserModel> currentUser = Rxn();
  RxInt selectedIndex = 0.obs;
  RxBool isSideBarExtended = true.obs;

  List<String> get menuItems => [
        "Dashboard",
        "Categories",
        "Subcategories",
        "Products",
        "Users",
        "Enquiries",
        "Vehicles",
        "Drivers",
        "Bookings",
        "CMS",
        "Settings",
      ];

  void setMenuIndex(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.rootDelegate.toNamed(Routes.ADMIN_DASHBOARD);
        break;
      case 1:
        Get.rootDelegate.toNamed(Routes.ADMIN_CATEGORIES);
        break;
      case 2:
        Get.rootDelegate.toNamed(Routes.ADMIN_SUB_CATEGORIES);
        break;
      case 3:
        Get.rootDelegate.toNamed(Routes.ADMIN_PRODUCTS);
        break;
      case 4:
        Get.rootDelegate.toNamed(Routes.ADMIN_USERS);
        break;
      case 5:
        Get.rootDelegate.toNamed(Routes.ADMIN_ENQUIRIES);
        break;
      case 6:
        Get.rootDelegate.toNamed(Routes.ADMIN_VEHICLES);
        break;
      case 7:
        Get.rootDelegate.toNamed(Routes.ADMIN_DRIVERS);
      case 8:
        Get.rootDelegate.toNamed(Routes.ADMIN_BOOKINGS);
      case 9:
        Get.rootDelegate.toNamed(Routes.ADMIN_CMS);
        break;
      case 10:
        Get.rootDelegate.toNamed(Routes.ADMIN_PROFILE);
        break;
    }
  }

  @override
  void onReady() {
    super.onReady();
    currentUser.value = UserModel.fromStorage();
  }
}

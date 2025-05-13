import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MenuController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxnInt footerSocialIconHover = RxnInt();
  RxnInt headerSocialIconHover = RxnInt();

  List<String> get menuItems =>
      ["Home", "Our Services", "About Us", "Blogs", "Contact Us"];

  void setMenuIndex(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.rootDelegate.toNamed(Routes.HOME);
        break;
      case 1:
        Get.rootDelegate.toNamed(Routes.OUR_SERVICES);
        break;
      case 2:
        Get.rootDelegate.toNamed(Routes.ABOUT_US);
        break;
      case 3:
        Get.rootDelegate.toNamed(Routes.BLOGS);
        break;
      case 4:
        Get.rootDelegate.toNamed(Routes.CONTACT_US);
        break;
    }
  }
}

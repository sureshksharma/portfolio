import 'package:get/get.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/admin_bookings/bindings/admin_bookings_binding.dart';
import '../modules/admin_bookings/views/admin_bookings_view.dart';
import '../modules/admin_categories/bindings/admin_categories_binding.dart';
import '../modules/admin_categories/views/admin_categories_view.dart';
import '../modules/admin_cms/bindings/admin_cms_binding.dart';
import '../modules/admin_cms/views/admin_cms_view.dart';
import '../modules/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/admin_drivers/bindings/admin_drivers_binding.dart';
import '../modules/admin_drivers/views/admin_drivers_view.dart';
import '../modules/admin_enquiries/bindings/admin_enquiries_binding.dart';
import '../modules/admin_enquiries/views/admin_enquiries_view.dart';
import '../modules/admin_products/bindings/admin_products_binding.dart';
import '../modules/admin_products/views/admin_products_view.dart';
import '../modules/admin_profile/bindings/admin_profile_binding.dart';
import '../modules/admin_profile/views/admin_profile_view.dart';
import '../modules/admin_sub_categories/bindings/admin_sub_categories_binding.dart';
import '../modules/admin_sub_categories/views/admin_sub_categories_view.dart';
import '../modules/admin_users/bindings/admin_users_binding.dart';
import '../modules/admin_users/views/admin_users_view.dart';
import '../modules/admin_vehicle_fare/bindings/admin_vehicle_fare_binding.dart';
import '../modules/admin_vehicle_fare/views/admin_vehicle_fare_view.dart';
import '../modules/admin_vehicle_type/bindings/admin_vehicle_type_binding.dart';
import '../modules/admin_vehicle_type/views/admin_vehicle_type_view.dart';
import '../modules/admin_vehicles/bindings/admin_vehicles_binding.dart';
import '../modules/admin_vehicles/views/admin_vehicles_view.dart';
import '../modules/blogs/bindings/blogs_binding.dart';
import '../modules/blogs/views/blogs_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/our_services/bindings/our_services_binding.dart';
import '../modules/our_services/views/our_services_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/unknown/bindings/unknown_binding.dart';
import '../modules/unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final UNKNOWN = routes.last;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => const UnknownView(),
      binding: UnknownBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.OUR_SERVICES,
      page: () => const OurServicesView(),
      binding: OurServicesBinding(),
    ),
    GetPage(
      name: _Paths.BLOGS,
      page: () => const BlogsView(),
      binding: BlogsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_USERS,
      page: () => const AdminUsersView(),
      binding: AdminUsersBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_VEHICLES,
      page: () => const AdminVehiclesView(),
      binding: AdminVehiclesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DRIVERS,
      page: () => const AdminDriversView(),
      binding: AdminDriversBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ENQUIRIES,
      page: () => const AdminEnquiriesView(),
      binding: AdminEnquiriesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_BOOKINGS,
      page: () => const AdminBookingsView(),
      binding: AdminBookingsBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_CMS,
      page: () => const AdminCmsView(),
      binding: AdminCmsBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_CATEGORIES,
      page: () => const AdminCategoriesView(),
      binding: AdminCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SUB_CATEGORIES,
      page: () => const AdminSubCategoriesView(),
      binding: AdminSubCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PRODUCTS,
      page: () => const AdminProductsView(),
      binding: AdminProductsBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PROFILE,
      page: () => const AdminProfileView(),
      binding: AdminProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_VEHICLE_TYPE,
      page: () => const AdminVehicleTypeView(),
      binding: AdminVehicleTypeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_VEHICLE_FARE,
      page: () => const AdminVehicleFareView(),
      binding: AdminVehicleFareBinding(),
    ),
  ];
}

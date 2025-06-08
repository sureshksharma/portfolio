import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/driver.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminDriversController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxnInt selectedStatus = RxnInt();
  RxList<DriverModel> drivers = <DriverModel>[].obs;
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid category name.';
    }
    return null;
  }

  String? validateLicenseNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid license no.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !GetUtils.isEmail(value)) {
      return 'Please enter valid email.';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length != 10 ||
        !value.startsWith(RegExp(r'[6-9]'))) {
      return 'Please enter valid phone number.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select category status.';
    }
    return null;
  }

  Future<void> fetchDrivers() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllDrivers($limit: Int!, $offset: Int!) {
            getAllDrivers(limit: $limit, offset: $offset) {
              id
              name
              license_no
              phone
              email
              status
            }
          }
          '''),
            ),
          );

      if (result.hasException) {
        SnackbarUtil.showError(
          message: result.exception?.graphqlErrors.firstOrNull?.message ??
              'Some error occurred. Please try again later or contact support.',
        );
        Logger().e('fetchDrivers: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allDrivers = (result.data?['getAllDrivers'] as List?)
              ?.map((c) => DriverModel.fromJson(c))
              .toList();
          drivers.assignAll(allDrivers ?? []);
        } else {
          SnackbarUtil.showError(
              message:
                  'Some error occurred. Please try again later or contact support.');
          Logger().d(result.data);
        }
      }
    } catch (e) {
      SnackbarUtil.showError(
          message:
              'Some error occurred. Please try again later or contact support.');
      Logger().e('fetchDrivers: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createDriver() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'name': nameController.text,
                'license_no': licenseController.text,
                'phone': phoneController.text,
                'email': emailController.text,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateDriver($name: String!, $license_no: String!, $phone: String!, $email: String!, $status: Int!) {
            createDriver(name: $name, license_no: $license_no, phone: $phone, email: $email, status: $status) {
              id
              name
              license_no
              phone
              email
              status
            }
          }
          '''),
            ),
          );

      if (result.hasException) {
        SnackbarUtil.showError(
          message: result.exception?.graphqlErrors.firstOrNull?.message ??
              'Some error occurred. Please try again later or contact support.',
        );
        Logger().e('createDriver: ', error: result.exception);
      } else {
        if (result.data != null) {
          drivers.add(DriverModel.fromJson(result.data?['createDriver']));
          drivers.refresh();
          nameController.clear();
          licenseController.clear();
          phoneController.clear();
          emailController.clear();
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Driver created successfully!',
          );
        } else {
          SnackbarUtil.showError(
              message:
                  'Some error occurred. Please try again later or contact support.');
          Logger().d(result.data);
        }
      }
    } catch (e) {
      SnackbarUtil.showError(
          message:
              'Some error occurred. Please try again later or contact support.');
      Logger().e('createDriver: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchDrivers();
  }
}

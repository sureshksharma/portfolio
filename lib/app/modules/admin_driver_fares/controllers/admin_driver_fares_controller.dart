import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/driver.model.dart';
import '../../../domain/admin/driver_fare.model.dart';
import '../../../domain/admin/type.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminDriverFaresController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fareController = TextEditingController();
  RxList<DriverFareModel> fares = <DriverFareModel>[].obs;
  RxList<TypeModel> fareTypes = <TypeModel>[].obs;
  RxList<DriverModel> drivers = <DriverModel>[].obs;
  Rxn<TypeModel> selectedFareType = Rxn();
  Rxn<DriverModel> selectedDriver = Rxn();
  RxnInt selectedStatus = RxnInt();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  String? validatFare(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return 'Please enter valid fare.';
    }
    return null;
  }

  String? validateType(TypeModel? value) {
    if (value == null) {
      return 'Please select fare type.';
    }
    return null;
  }

  String? validateDriver(DriverModel? value) {
    if (value == null) {
      return 'Please select driver.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select status.';
    }
    return null;
  }

  Future<void> fetchFares() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllDriverFares($limit: Int!, $offset: Int!) {
            getAllDriverFares(limit: $limit, offset: $offset) {
              id
              driver {
                id
                name
              }
              fare_type {
                id
                name
              }
              fare
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
        Logger().e('fetchTypes: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allTypes = (result.data?['getAllDriverFares'] as List?)
              ?.map((c) => DriverFareModel.fromJson(c))
              .toList();
          fares.assignAll(allTypes ?? []);
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
      Logger().e('fetchTypes: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
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
          final allVehicles = (result.data?['getAllDrivers'] as List?)
              ?.map((c) => DriverModel.fromJson(c))
              .toList();
          drivers.assignAll(allVehicles ?? []);
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

  Future<void> fetchFareTypes() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 10,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllFareTypes($limit: Int!, $offset: Int!) {
            getAllFareTypes(limit: $limit, offset: $offset) {
              id
              name
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
        Logger().e('fetchFareTypes: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allTypes = (result.data?['getAllFareTypes'] as List?)
              ?.map((c) => TypeModel.fromJson(c))
              .toList();
          fareTypes.assignAll(allTypes ?? []);
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
      Logger().e('fetchFareTypes: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createFare() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'driver_id': selectedDriver.value?.id,
                'fare_type': selectedFareType.value?.id,
                'fare': double.parse(fareController.text),
                'status': selectedStatus.value,
              },
              document: gql(r'''
          mutation CreateDriverFare($driver_id: Int!, $fare_type: Int!, $fare: Float!, $status: Int!, ) {
            createDriverFare(driver_id: $driver_id, fare_type: $fare_type, fare: $fare, status: $status) {
              id
              driver {
                id
                name
              }
              fare_type {
                id
                name
              }
              fare
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
        Logger().e('createFare: ', error: result.exception);
      } else {
        if (result.data != null) {
          fares.add(DriverFareModel.fromJson(result.data?['createDriverFare']));
          fares.refresh();
          fareController.clear();
          selectedDriver.value = null;
          selectedFareType.value = null;
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Vehicle Fare created successfully!',
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
      Logger().e('createFare: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchFares();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/type.model.dart';
import '../../../domain/admin/vehicle.model.dart';
import '../../../domain/admin/vehicle_fare.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminVehicleFareController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fareController = TextEditingController();
  RxList<VehicleFareModel> fares = <VehicleFareModel>[].obs;
  RxList<TypeModel> fareTypes = <TypeModel>[].obs;
  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;
  Rxn<TypeModel> selectedFareType = Rxn();
  Rxn<VehicleModel> selectedVehicle = Rxn();
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

  String? validateVehicle(VehicleModel? value) {
    if (value == null) {
      return 'Please select vehicle.';
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
          query GetAllVehicleFares($limit: Int!, $offset: Int!) {
            getAllVehicleFares(limit: $limit, offset: $offset) {
              id
              vehicle {
                id
                make
                model
                year
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
          final allTypes = (result.data?['getAllVehicleFares'] as List?)
              ?.map((c) => VehicleFareModel.fromJson(c))
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

  Future<void> fetchVehicles() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllVehicles($limit: Int!, $offset: Int!) {
            getAllVehicles(limit: $limit, offset: $offset) {
              id
              make
              model
              year
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
        Logger().e('fetchVehicles: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allVehicles = (result.data?['getAllVehicles'] as List?)
              ?.map((c) => VehicleModel.fromJson(c))
              .toList();
          vehicles.assignAll(allVehicles ?? []);
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
      Logger().e('fetchVehicles: ', error: e);
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
                'vehicle_id': selectedVehicle.value?.id,
                'fare_type': selectedFareType.value?.id,
                'fare': double.parse(fareController.text),
                'status': selectedStatus.value,
              },
              document: gql(r'''
          mutation CreateVehicleFare($vehicle_id: Int!, $fare_type: Int!, $fare: Float!, $status: Int!, ) {
            createVehicleFare(vehicle_id: $vehicle_id, fare_type: $fare_type, fare: $fare, status: $status) {
              id
              vehicle {
                id
                make
                model
                year
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
          fares.add(
              VehicleFareModel.fromJson(result.data?['createVehicleFare']));
          fares.refresh();
          fareController.clear();
          selectedVehicle.value = null;
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

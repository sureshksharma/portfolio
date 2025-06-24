import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/product.model.dart';
import '../../../domain/admin/product_fare.model.dart';
import '../../../domain/admin/type.model.dart';
import '../../../domain/admin/vehicle.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminProductFaresController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController durationController = TextEditingController();
  TextEditingController durationTypeController = TextEditingController();
  TextEditingController baseFareController = TextEditingController();
  TextEditingController finalFareController = TextEditingController();
  RxList<ProductFareModel> fares = <ProductFareModel>[].obs;
  RxList<TypeModel> fareTypes = <TypeModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;
  Rxn<TypeModel> selectedFareType = Rxn();
  Rxn<ProductModel> selectedProduct = Rxn();
  Rxn<VehicleModel> selectedVehicle = Rxn();
  RxnString vehicleFare = RxnString();
  RxnInt selectedStatus = RxnInt();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  void onFareTypeChange(TypeModel? value) {
    selectedFareType.value = value;
    vehicleFare.value =
        '${selectedVehicle.value?.fare?.firstWhereOrNull((f) => f.fareType?.id == selectedFareType.value?.id)?.fare ?? 0}/${selectedVehicle.value?.fare?.firstWhereOrNull((f) => f.fareType?.id == selectedFareType.value?.id)?.fareType?.name ?? ''}';
  }

  String? validatFare(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return 'Please enter valid fare.';
    }
    return null;
  }

  String? validatDuration(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return 'Please enter valid duration.';
    }
    return null;
  }

  String? validatDurationType(String? value) {
    if (value == 'day' || value == 'hour' || value == 'week') {
      return null;
    } else {
      return 'Please enter day, hour or week.';
    }
  }

  String? validateType(TypeModel? value) {
    if (value == null) {
      return 'Please select fare type.';
    }
    return null;
  }

  String? validateProduct(ProductModel? value) {
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

  void clearFields() {
    durationTypeController.clear();
    durationTypeController.clear();
    baseFareController.clear();
    finalFareController.clear();
    selectedProduct.value = null;
    selectedVehicle.value = null;
    selectedFareType.value = null;
    selectedStatus.value = null;
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
          query GetAllProductFares($limit: Int!, $offset: Int!) {
            getAllProductFares(limit: $limit, offset: $offset) {
              id
              product {
                id
                name
              }
              duration
              duration_type
              vehicle {
                id
                make
                model
                year
                fare {
                  fare_type {
                    id
                    name
                  }
                  fare
                  status
                }
              }
              fare_type {
                id
                name
              }
              base_fare
              final_fare
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
          final allTypes = (result.data?['getAllProductFares'] as List?)
              ?.map((c) => ProductFareModel.fromJson(c))
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

  Future<void> fetchProducts() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllProducts($limit: Int!, $offset: Int!) {
            getAllProducts(limit: $limit, offset: $offset) {
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
        Logger().e('fetchProducts: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allProducts = (result.data?['getAllProducts'] as List?)
              ?.map((c) => ProductModel.fromJson(c))
              .toList();
          products.assignAll(allProducts ?? []);
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
      Logger().e('fetchProducts: ', error: e);
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
              fare {
                  fare_type {
                    id
                    name
                  }
                  fare
                  status
                }
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
                'product_id': selectedProduct.value?.id,
                'duration': int.parse(durationController.text),
                'duration_type': durationTypeController.text,
                'vehicle': selectedVehicle.value?.id,
                'fare_type': selectedFareType.value?.id,
                'base_fare': double.parse(baseFareController.text),
                'final_fare': double.parse(finalFareController.text),
                'status': selectedStatus.value,
              },
              document: gql(r'''
          mutation CreateProductFare($product_id: Int!, $duration: Int!, $duration_type: String!, $vehicle: Int!, $fare_type: Int!, $base_fare: Float!, $final_fare: Float!, $status: Int!, ) {
            createProductFare(product_id: $product_id, duration: $duration, duration_type: $duration_type, vehicle: $vehicle, fare_type: $fare_type, base_fare: $base_fare, final_fare: $final_fare, status: $status) {
              id
              product {
                id
                name
              }
              duration
              duration_type
              vehicle {
                id
                make
                model
                year
                fare {
                  fare_type {
                    id
                    name
                  }
                  fare
                  status
                }
              }
              fare_type {
                id
                name
              }
              base_fare
              final_fare
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
              ProductFareModel.fromJson(result.data?['createProductFare']));
          fares.refresh();
          durationTypeController.clear();
          durationTypeController.clear();
          baseFareController.clear();
          finalFareController.clear();
          selectedProduct.value = null;
          selectedVehicle.value = null;
          selectedFareType.value = null;
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Product Fare created successfully!',
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

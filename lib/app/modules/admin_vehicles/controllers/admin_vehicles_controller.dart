import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/type.model.dart';
import '../../../domain/admin/vehicle.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminVehiclesController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  RxnInt selectedStatus = RxnInt();
  Rxn<TypeModel> selectedVehicleType = Rxn();
  RxList<TypeModel> vehicleTypes = <TypeModel>[].obs;
  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;
  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> selectedImage = Rxn();
  Rxn<Uint8List> selectedImageBytes = Rxn();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  String? validateMake(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid vehilce make.';
    }
    return null;
  }

  String? validateModel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid vehicle model.';
    }
    return null;
  }

  String? validateLicensePlate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid license plate.';
    }
    return null;
  }

  String? validateYear(String? value) {
    if (value == null ||
        value.isEmpty ||
        !GetUtils.isNumericOnly(value) ||
        !GetUtils.isLengthEqualTo(value, 4)) {
      return 'Please enter valid year e.g. 2023.';
    }
    return null;
  }

  String? validateCapacity(String? value) {
    if (value == null || value.isEmpty || !GetUtils.isNumericOnly(value)) {
      return 'Please enter valid vehicle capacity.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select vehicle status.';
    }
    return null;
  }

  String? validateType(TypeModel? value) {
    if (value == null) {
      return 'Please select vehicle type.';
    }
    return null;
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
      imageQuality: 50,
    );
    selectedImage.value = image;
    if (selectedImage.value != null) {
      selectedImageBytes.value = await image!.readAsBytes();
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
              type {
                id
                name
              }
              capacity
              license_plate
              image
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

  Future<void> fetchVehicleTypes() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 10,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllVehicleTypes($limit: Int!, $offset: Int!) {
            getAllVehicleTypes(limit: $limit, offset: $offset) {
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
        Logger().e('fetchVehicleTypes: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allTypes = (result.data?['getAllVehicleTypes'] as List?)
              ?.map((c) => TypeModel.fromJson(c))
              .toList();
          vehicleTypes.assignAll(allTypes ?? []);
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
      Logger().e('fetchVehicleTypes: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createVehicle() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      var multipartFile = MultipartFile.fromBytes(
        'image',
        selectedImageBytes.value!,
        filename: selectedImage.value!.name,
        contentType: selectedImage.value!.mimeType != null
            ? MediaType(selectedImage.value!.mimeType!.split('/')[0],
                selectedImage.value!.mimeType!.split('/')[1])
            : null,
      );
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'make': makeController.text,
                'model': modelController.text,
                'year': int.parse(yearController.text),
                'type': selectedVehicleType.value?.id,
                'capacity': int.parse(capacityController.text),
                'license_plate': licensePlateController.text,
                'image': multipartFile,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateVehicle($make: String!, $model: String!, $year: Int!, $capacity: Int!, $license_plate: String!, $image: Upload!, $status: Int!) {
            createVehicle(make: $make, model: $model, year: $year, capacity: $capacity, license_plate: $license_plate, image: $image, status: $status) {
              id
              make
              model
              year
              type {
                id
                name
              }
              capacity
              license_plate
              image
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
        Logger().e('createVehicle: ', error: result.exception);
      } else {
        if (result.data != null) {
          vehicles.add(VehicleModel.fromJson(result.data?['createVehicle']));
          vehicles.refresh();
          makeController.clear();
          modelController.clear();
          yearController.clear();
          capacityController.clear();
          licensePlateController.clear();
          selectedVehicleType.value = null;
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Vehicle created successfully!',
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
      Logger().e('createVehicle: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchVehicles();
  }
}

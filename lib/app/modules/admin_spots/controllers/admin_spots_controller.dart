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
import '../../../domain/admin/city.model.dart';
import '../../../domain/admin/spot.model.dart';
import '../../../domain/admin/state.model.dart';
import '../../../domain/admin/type.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminSpotsController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RxnInt selectedStatus = RxnInt();
  Rxn<TypeModel> selectedSpotType = Rxn();
  Rxn<StateModel> selectedState = Rxn();
  Rxn<CityModel> selectedCity = Rxn();
  RxList<StateModel> states = <StateModel>[].obs;
  RxList<CityModel> cites = <CityModel>[].obs;
  RxList<TypeModel> spotTypes = <TypeModel>[].obs;
  RxList<SpotModel> spots = <SpotModel>[].obs;
  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> selectedImage = Rxn();
  Rxn<Uint8List> selectedImageBytes = Rxn();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid spot name.';
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid spot location.';
    }
    return null;
  }

  String? validateLat(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return 'Please enter valid spot latitude.';
    }
    return null;
  }

  String? validateLong(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return 'Please enter valid spot longitude.';
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid spot description.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select spot status.';
    }
    return null;
  }

  String? validateType(TypeModel? value) {
    if (value == null) {
      return 'Please select spot type.';
    }
    return null;
  }

  String? validateState(StateModel? value) {
    if (value == null) {
      return 'Please select spot state.';
    }
    return null;
  }

  String? validateCity(CityModel? value) {
    if (value == null) {
      return 'Please select spot city.';
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

  Future<void> fetchSpots() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllSpots($limit: Int!, $offset: Int!) {
            getAllSpots(limit: $limit, offset: $offset) {
              id
              name
              location
              latitude
              longitude
              type {
                id
                name
              }
              desc
              state {
                id
                title
              }
              city {
                id
                title
              }
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
        Logger().e('fetchSpots: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allVehicles = (result.data?['getAllSpots'] as List?)
              ?.map((c) => SpotModel.fromJson(c))
              .toList();
          spots.assignAll(allVehicles ?? []);
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
      Logger().e('fetchSpots: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> fetchSpotTypes() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 10,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllSpotTypes($limit: Int!, $offset: Int!) {
            getAllSpotTypes(limit: $limit, offset: $offset) {
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
        Logger().e('fetchSpotTypes: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allTypes = (result.data?['getAllSpotTypes'] as List?)
              ?.map((c) => TypeModel.fromJson(c))
              .toList();
          spotTypes.assignAll(allTypes ?? []);
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
      Logger().e('fetchSpotTypes: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> fetchStates() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              document: gql(r'''
          query GetAllStates {
            getAllStates {
              id
              title
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
        Logger().e('fetchStates: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allStates = (result.data?['getAllStates'] as List?)
              ?.map((c) => StateModel.fromJson(c))
              .toList();
          states.assignAll(allStates ?? []);
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
      Logger().e('fetchStates: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> fetchCities() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {'state': selectedState.value?.id},
              document: gql(r'''
          query GetAllCities($state: Int!) {
            getAllCities(state: $state) {
              id
              title
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
        Logger().e('fetchCities: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allCities = (result.data?['getAllCities'] as List?)
              ?.map((c) => CityModel.fromJson(c))
              .toList();
          cites.assignAll(allCities ?? []);
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
      Logger().e('fetchCities: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createSpot() async {
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
                'name': nameController.text,
                'location': locationController.text,
                'latitude': double.parse(latController.text),
                'longitude': double.parse(longController.text),
                'type': selectedSpotType.value?.id,
                'desc': descController.text,
                'state': selectedState.value?.id,
                'city': selectedCity.value?.id,
                'image': multipartFile,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateSpot($name: String!, $location: String!, $latitude: Float!, $longitude: Float!, $type: Int!, $desc: String!, $state: Int!, $city: Int!, $image: Upload!, $status: Int!) {
            createSpot(name: $name, location: $location, latitude: $latitude, longitude: $longitude, type: $type, desc: $desc, state: $state, city: $city, image: $image, status: $status) {
              id
              name
              location
              latitude
              longitude
              type {
                id
                name
              }
              desc
              state {
                id
                title
              }
              city {
                id
                title
              }
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
        Logger().e('createSpot: ', error: result.exception);
      } else {
        if (result.data != null) {
          spots.add(SpotModel.fromJson(result.data?['createSpot']));
          spots.refresh();
          nameController.clear();
          locationController.clear();
          latController.clear();
          longController.clear();
          descController.clear();
          selectedState.value = null;
          selectedCity.value = null;
          selectedSpotType.value = null;
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(message: 'Spot created successfully!');
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
      Logger().e('createSpot: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchSpots();
  }
}

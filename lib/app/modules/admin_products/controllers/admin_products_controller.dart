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
import '../../../domain/admin/product.model.dart';
import '../../../domain/admin/subcategory.model.dart';
import '../../../domain/admin/type.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminProductsController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RxnInt selectedStatus = RxnInt();
  Rxn<TypeModel> selectedProductType = Rxn();
  RxList<TypeModel> productTypes = <TypeModel>[].obs;
  Rxn<SubcategoryModel> selectedProductCategory = Rxn();
  RxList<SubcategoryModel> productCategories = <SubcategoryModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> selectedImage = Rxn();
  Rxn<Uint8List> selectedImageBytes = Rxn();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid product name.';
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid product description.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select product status.';
    }
    return null;
  }

  String? validateType(TypeModel? value) {
    if (value == null) {
      return 'Please select product type.';
    }
    return null;
  }

  String? validateCategory(SubcategoryModel? value) {
    if (value == null) {
      return 'Please select parent category.';
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
              category {
                id
                name
              }
              type {
                id
                name
              }
              desc
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
        Logger().e('fetchProducts: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allVehicles = (result.data?['getAllProducts'] as List?)
              ?.map((c) => ProductModel.fromJson(c))
              .toList();
          products.assignAll(allVehicles ?? []);
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

  Future<void> fetchProductTypes() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 10,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllProductTypes($limit: Int!, $offset: Int!) {
            getAllProductTypes(limit: $limit, offset: $offset) {
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
        Logger().e('fetchProductTypes: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allTypes = (result.data?['getAllProductTypes'] as List?)
              ?.map((c) => TypeModel.fromJson(c))
              .toList();
          productTypes.assignAll(allTypes ?? []);
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
      Logger().e('fetchProductTypes: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> fetchProductCategories() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 100,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllSubcategories($limit: Int!, $offset: Int!) {
            getAllSubcategories(limit: $limit, offset: $offset) {
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
        Logger().e('fetchProductCategories: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allCategories = (result.data?['getAllSubcategories'] as List?)
              ?.map((c) => SubcategoryModel.fromJson(c))
              .toList();
          productCategories.assignAll(allCategories ?? []);
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
      Logger().e('fetchProductCategories: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createProduct() async {
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
                'category': selectedProductCategory.value?.id,
                'type': selectedProductType.value?.id,
                'desc': descController.text,
                'image': multipartFile,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateProduct($name: String!, $category: Int!, $type: Int!, $desc: String!, $image: Upload!, $status: Int!) {
            createProduct(name: $name, category: $category, type: $type, desc: $desc, image: $image, status: $status) {
              id
              name
              category {
                id
                name
              }
              type {
                id
                name
              }
              desc
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
        Logger().e('createProduct: ', error: result.exception);
      } else {
        if (result.data != null) {
          products.add(ProductModel.fromJson(result.data?['createProduct']));
          products.refresh();
          nameController.clear();
          descController.clear();
          selectedProductType.value = null;
          selectedStatus.value = null;
          selectedProductCategory.value = null;
          Get.back();
          SnackbarUtil.showSuccess(message: 'Product created successfully!');
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
      Logger().e('createProduct: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchProducts();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/category.model.dart';
import '../../../domain/admin/subcategory.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminSubCategoriesController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  Rxn<CategoryModel> selectedCategory = Rxn();
  RxnInt selectedStatus = RxnInt();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<SubcategoryModel> subcategories = <SubcategoryModel>[].obs;
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();
  Rxn<Future> futureDialog = Rxn();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid subcategory name.';
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid subcategory description.';
    }
    return null;
  }

  String? validateCategory(CategoryModel? value) {
    if (value == null) {
      return 'Please select category.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select subcategory status.';
    }
    return null;
  }

  Future<void> fetchSubcategories() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllSubcategories($limit: Int!, $offset: Int!) {
            getAllSubcategories(limit: $limit, offset: $offset) {
              id
              name
              category {
                name
              }
              products
              desc
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
        Logger().e('fetchSubcategories: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allCategores = (result.data?['getAllSubcategories'] as List)
              .map((c) => SubcategoryModel.fromJson(c))
              .toList();
          subcategories.assignAll(allCategores);
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
      Logger().e('fetchSubcategories: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> fetchCategories() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': 10,
                'offset': 0,
              },
              document: gql(r'''
          query GetAllCategories($limit: Int!, $offset: Int!) {
            getAllCategories(limit: $limit, offset: $offset) {
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
        Logger().e('fetchCategories: ', error: result.exception);
      } else {
        if (result.data != null) {
          final allCategores = (result.data?['getAllCategories'] as List)
              .map((c) => CategoryModel.fromJson(c))
              .toList();
          categories.assignAll(allCategores);
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
      Logger().e('fetchCategories: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> createSubcategory() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'name': nameController.text,
                'category': selectedCategory.value!.id!,
                'desc': descController.text,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateSubcategory($name: String!, $category: Int!, $desc: String!, $status: Int!) {
            createSubcategory(name: $name, category: $category, desc: $desc, status: $status) {
              id
              name
              category {
                name
              }
              products
              desc
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
        Logger().e('createSubcategory: ', error: result.exception);
      } else {
        if (result.data != null) {
          subcategories.add(
              SubcategoryModel.fromJson(result.data?['createSubcategory']));
          subcategories.refresh();
          nameController.clear();
          descController.clear();
          selectedStatus.value = null;
          selectedCategory.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Subcategory created successfully!',
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
      Logger().e('createSubcategory: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchSubcategories();
  }
}

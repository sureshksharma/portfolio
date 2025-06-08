import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/admin/category.model.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminCategoriesController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RxnInt selectedStatus = RxnInt();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid category name.';
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid category description.';
    }
    return null;
  }

  String? validateStatus(int? value) {
    if (value == null) {
      return 'Please select category status.';
    }
    return null;
  }

  Future<void> fetchCategories() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetAllCategories($limit: Int!, $offset: Int!) {
            getAllCategories(limit: $limit, offset: $offset) {
              id
              name
              subcategories
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

  Future<void> createCategory() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'name': nameController.text,
                'desc': descController.text,
                'status': selectedStatus.value!
              },
              document: gql(r'''
          mutation CreateCategory($name: String!, $desc: String!, $status: Int!) {
            createCategory(name: $name, desc: $desc, status: $status) {
              id
              name
              subcategories
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
        Logger().e('createCategory: ', error: result.exception);
      } else {
        if (result.data != null) {
          categories
              .add(CategoryModel.fromJson(result.data?['createCategory']));
          categories.refresh();
          nameController.clear();
          descController.clear();
          selectedStatus.value = null;
          Get.back();
          SnackbarUtil.showSuccess(
            message: 'Category created successfully!',
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
      Logger().e('createCategory: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchCategories();
  }
}

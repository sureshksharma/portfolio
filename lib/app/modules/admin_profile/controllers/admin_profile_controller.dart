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
import '../../../domain/auth/models/user.model.dart';
import '../../shared/controllers/admin_main.controller.dart';
import '../../shared/controllers/loading_controller.dart';

class AdminProfileController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  Rxn<UserModel> currentUser = Rxn();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newConfirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKeyPersonal = GlobalKey();
  final GlobalKey<FormState> formKeyPassword = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> selectedImage = Rxn();
  Rxn<Uint8List> selectedImageBytes = Rxn();

  String? get getRole => switch (currentUser.value?.role) {
        '0' => 'Administrator',
        '1' => 'User',
        _ => 'Other'
      };

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your valid full name.';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your valid phone number.';
    } else if (value.length != 10 || !value.startsWith(RegExp(r'[6-9]'))) {
      return 'Please enter your valid phone number.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter password with at least 6 characters.';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != newPasswordController.text) {
      return 'Password not matched.';
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
      if (selectedImageBytes.value != null) {
        await updateAvatar();
      }
    }
  }

  Future<void> updatePersonalInfo() async {
    if (!formKeyPersonal.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'role': currentUser.value?.role,
                'name': nameController.text,
                'email': currentUser.value?.email,
                'phone': phoneController.text,
              },
              document: gql(r'''
          mutation UpdateUser($role: String!, $name: String!, $email: String!, $phone: String!) {
            updateUser(role: $role, name: $name, email: $email, phone: $phone) {
              name
              phone
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
        Logger().e('updatePersonalInfo: ', error: result.exception);
      } else {
        if (result.data != null) {
          final updatedUser = currentUser.value?.copyWith(
            name: result.data?['updateUser']['name'],
            phone: result.data?['updateUser']['phone'],
          );
          await updatedUser?.save();
          SnackbarUtil.showSuccess(
            message: 'Personal info updated successfully!',
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
      Logger().e('updatePersonalInfo: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> changePassword() async {
    if (!formKeyPassword.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'current': currentPasswordController.text,
                'updated': newConfirmPasswordController.text,
              },
              document: gql(r'''
          mutation UpdatePassword($current: String!, $updated: String!) {
            updatePassword(current: $current, updated: $updated)
          }
          '''),
            ),
          );

      if (result.hasException) {
        SnackbarUtil.showError(
          message: result.exception?.graphqlErrors.firstOrNull?.message ??
              'Some error occurred. Please try again later or contact support.',
        );
        Logger().e('changePassword: ', error: result.exception);
      } else {
        if (result.data != null) {
          currentPasswordController.clear();
          newPasswordController.clear();
          newConfirmPasswordController.clear();
          SnackbarUtil.showSuccess(message: 'Password updated successfully!');
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
      Logger().e('changePassword: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> updateAvatar() async {
    try {
      _loadingController.isLoading = true;
      var multipartFile = MultipartFile.fromBytes(
        'avatar',
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
                'avatar': multipartFile,
              },
              document: gql(r'''
          mutation UpdateUserAvatar($avatar: Upload!) {
            updateUserAvatar(avatar: $avatar)
          }
          '''),
            ),
          );

      if (result.hasException) {
        SnackbarUtil.showError(
          message: result.exception?.graphqlErrors.firstOrNull?.message ??
              'Some error occurred. Please try again later or contact support.',
        );
        Logger().e('updatePersonalInfo: ', error: result.exception);
      } else {
        if (result.data != null) {
          final updatedUser = currentUser.value?.copyWith(
            avatar: result.data?['updateUserAvatar'],
          );
          await updatedUser?.save().whenComplete(() {
            Get.find<AdminMainController>().currentUser.value = updatedUser;
          });
          SnackbarUtil.showSuccess(
              message: 'Profile avatar updated successfully!');
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
      Logger().e('updatePersonalInfo: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onInit() {
    currentUser.value = UserModel.fromStorage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    nameController.text = currentUser.value?.name ?? '';
    phoneController.text = currentUser.value?.phone ?? '';
  }
}

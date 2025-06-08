import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/auth/models/user.model.dart';
import '../../../routes/app_pages.dart';
import '../../shared/controllers/loading_controller.dart';

class LoginController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  RxBool onRegisterHover = false.obs;
  RxBool hidePassword = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  String? validateEmail(String? value) {
    if (value == null || !GetUtils.isEmail(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null) {
      return 'Please enter password.';
    } else if (GetUtils.isLengthLessThan(value.trim(), 6)) {
      return 'Password should contains at least 6 characters without spaces.';
    }
    return null;
  }

  Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().mutate(
            MutationOptions(
              variables: {
                'email': emailController.text,
                'password': passwordController.text,
              },
              document: gql(r'''
          mutation LoginUser($email: String!, $password: String!) {
            loginUser(email: $email, password: $password) {
              id
              role
              name
              email
              phone
              avatar
              token
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
        Logger().e('loginUser: ', error: result.exception);
      } else {
        if (result.data != null) {
          final user = UserModel.fromJson(result.data!['loginUser']);
          await user.save().whenComplete(() {
            switch (user.role) {
              case '0':
                Get.rootDelegate.history.clear();
                Get.rootDelegate.toNamed(Routes.ADMIN_DASHBOARD);
                break;
              case '1':
                Get.rootDelegate.history.clear();
                Get.rootDelegate.toNamed(Routes.HOME);
                break;
              case '2':
                // Handle other roles if any
                break;
            }
          });
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
      Logger().e('loginUser: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    UserModel.clear().whenComplete(() {
      Logger().d('User Wiped!');
    });
  }
}

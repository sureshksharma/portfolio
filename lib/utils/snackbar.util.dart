import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class SnackbarUtil {
  static void showSuccess({required String message}) {
    Get.rawSnackbar(
      title: 'Success',
      icon: Icon(
        Icons.thumb_up,
        color: MaterialTheme.colorGreen,
      ),
      message: message,
      backgroundColor: MaterialTheme.colorGreen.withAlpha(153),
      borderRadius: 10,
      maxWidth: 500,
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showWarning({required String message}) {
    Get.rawSnackbar(
      title: 'Alert',
      icon: Icon(Icons.warning, color: Colors.amber),
      message: message,
      backgroundColor: Colors.amberAccent[200]!,
      borderRadius: 10,
      maxWidth: 500,
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      icon: Icon(
        Icons.thumb_down,
        color: Get.theme.colorScheme.error,
      ),
      message: message,
      backgroundColor: Get.theme.colorScheme.error.withAlpha(153),
      borderRadius: 10,
      maxWidth: 500,
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

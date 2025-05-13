import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showSuccess({required String message}) {
    Get.rawSnackbar(
      title: 'Success',
      icon: Icon(
        Icons.thumb_up,
        color: Get.theme.colorScheme.secondary,
      ),
      message: message,
      backgroundColor: Get.theme.colorScheme.secondary.withAlpha(153),
      borderRadius: 20,
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
      borderRadius: 20,
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
      borderRadius: 20,
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

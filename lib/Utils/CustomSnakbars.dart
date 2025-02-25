import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackbar(String title, String message) {
  Get.snackbar(
    title, message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
  );
}

void showErrorSnackbar(String title, String message) {
  Get.snackbar(
    title, message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
  );
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackbar(String message, {bool isTop = true}) {
  Get.snackbar(
    "Success",
    message,
    snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    icon: const Icon(Icons.check_circle, color: Colors.white),
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

void showErrorSnackbar(String message, {bool isTop = true}) {
  Get.snackbar(
    "Error",
    message,
    snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    icon: const Icon(Icons.error, color: Colors.white),
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

void showWarningSnackbar(String message, {bool isTop = true}) {
  Get.snackbar(
    "Warning",
    message,
    snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
    backgroundColor: Colors.orange,
    colorText: Colors.white,
    icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

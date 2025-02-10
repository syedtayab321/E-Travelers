import 'package:e_traverlers/Utils/custom_snakbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  var selectedCountryCode = '+1'.obs;

  void signup() {
    if (formKey.currentState!.validate()) {
      showSuccessSnackbar('Create a new country');
    } else {
      showWarningSnackbar('Hello is not a warning');
    }
  }
}

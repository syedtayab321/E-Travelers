import 'package:e_traverlers/Utils/custom_snakbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Validations/login_validations.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  void performLogin() {
    final emailError = LoginValidations.validateEmail(emailController.text);
    final passwordError = LoginValidations.validatePassword(passwordController.text);

    if (emailError == null && passwordError == null) {
      showSuccessSnackbar('Login Successful');
    } else {
      if (emailError != null) {
        showErrorSnackbar(emailError);
      }
      if (passwordError != null) {
        showErrorSnackbar(passwordError);
      }
    }
  }
}
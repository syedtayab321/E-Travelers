import 'package:e_traverlers/Screens/Dashboard/bottom_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/CustomSnakbars.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorSnackbar("Error", "Please fill in all fields.");
      return;
    }

    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      showSuccessSnackbar("Success", "Login successful.");
      Get.offAll(BottomBarScreen()); // Navigate to dashboard
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar("Login Failed", e.message ?? "An error occurred.");
    } finally {
      isLoading.value = false;
    }
  }

}

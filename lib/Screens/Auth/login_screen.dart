import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Auth/signup_screen.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../FirebaseFunctions/login.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                SizedBox(width: 20),
                CustomTextWidget(
                  text: "User Login",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: loginController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: loginController.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed:
                      loginController.isLoading.value ? null : loginController.loginUser,
                      child: loginController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const CustomTextWidget(
                        text: "LOGIN",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(text: "Not registered yet? "),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterScreen());
                        },
                        child: CustomTextWidget(
                          text: "Register Now",
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_traverlers/Screens/Auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Auth/login_controller.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_textformfield.dart';
import '../../Utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const CustomTextWidgte(
                    text: "E-Travelers",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const CustomTextWidgte(
                    text: "Explore the world with ease",
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.emailController,
                    hintText: "Email or Phone Number",
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextFormField(
                    controller: controller.passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                    obscureText: !controller.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        controller.isPasswordVisible.value =
                        !controller.isPasswordVisible.value;
                      },
                    ),
                  )),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const CustomTextWidgte(
                        text: "Forgot Password?",
                        fontSize: 14,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    text: "Login",
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.performLogin();
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "Create an account",
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    text: "Continue without login",
                    backgroundColor: AppColors.primaryDark,
                    textColor: Colors.white,
                    onPressed: () {},
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

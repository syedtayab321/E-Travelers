import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Auth/signup_controller.dart';
import '../../Utils/app_colors.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_textformfield.dart';
import '../../Validations/signup_validator.dart';

class SignupScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: AppColors.primary,
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
                      text: "Sign Up",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    const CustomTextWidgte(
                      text: "Join us to explore the world",
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),

              // Form Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.usernameController,
                      hintText: "Username",
                      prefixIcon: Icons.person_outline,
                      validator: Validators.validateUsername,
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      controller: controller.phoneController,
                      hintText: "Phone Number",
                      prefixIcon: Icons.phone,
                      validator: (value) => Validators.validatePhoneNumber(
                          value, controller.selectedCountryCode.value),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.flag),
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              controller.selectedCountryCode.value =
                              '+${country.phoneCode}';
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: "Password",
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      validator: Validators.validatePassword,
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      controller: controller.confirmPasswordController,
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) =>
                          Validators.validateConfirmPassword(
                              value, controller.passwordController.text),
                    ),
                    const SizedBox(height: 30),

                    CustomElevatedButton(
                      text: "Sign Up",
                      backgroundColor: AppColors.primaryDark,
                      textColor: Colors.white,
                      onPressed: () => controller.signup(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

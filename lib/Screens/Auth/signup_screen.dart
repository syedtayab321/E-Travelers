import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/CustomWidgets/custom_textformfield.dart';
import 'package:e_traverlers/Screens/Auth/login_screen.dart';
import 'package:e_traverlers/Screens/Auth/user_more_details_registration.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Get.back();
          },
        ),
        title: const CustomTextWidget(
          text: 'User Register',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: "Full Name",
                        prefixIcon: Icons.person,
                        borderRadius: 10,
                        controller: fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Full name is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        labelText: "Email",
                        prefixIcon: Icons.email,
                        borderRadius: 10,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        labelText: "Password",
                        prefixIcon: Icons.lock,
                        borderRadius: 10,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        labelText: "Confirm Password",
                        prefixIcon: Icons.lock,
                        borderRadius: 10,
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm password is required";
                          } else if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(
                                UserMoreDetailRegistration(
                                  email: emailController,
                                  password: passwordController.text,
                                  fullName: fullNameController,
                                )
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Center(
                          child: CustomTextWidget(
                            text: 'REGISTER',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(text: "Already have an Account? "),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: CustomTextWidget(
                              text: "Login",
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
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

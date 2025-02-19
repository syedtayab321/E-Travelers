import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/CustomWidgets/custom_textformfield.dart';
import 'package:e_traverlers/Screens/Auth/login_screen.dart';
import 'package:e_traverlers/Screens/Auth/user_more_details_registration.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {},
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
                  const CustomTextFormField(
                      labelText: "Full Name",
                      prefixIcon:Icons.person,
                      borderRadius: 10,
                  ),
                  const SizedBox(height: 10),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialCountryCode: 'PK',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                      labelText: "Referral Code",
                        borderRadius: 10,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(UserMoreDetailRegistration());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Center(
                      child: CustomTextWidget(
                        text: 'REGISTER',
                            fontSize: 16,
                            color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(text: "Already have an Account? "),
                      GestureDetector(
                        onTap: () {
                          Get.to(const LoginScreen());
                        },
                        child: CustomTextWidget(
                          text: "Login",
                          color: Colors.blue.shade900, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextWidget(text: "OR"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.shade600,
                        radius: 20,
                        child: const Icon(Icons.g_mobiledata, color: Colors.white, size: 30),
                      ),
                      const SizedBox(width: 20),
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade800,
                        radius: 20,
                        child: const Icon(Icons.facebook, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

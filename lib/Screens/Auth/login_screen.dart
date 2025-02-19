import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Auth/signup_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/bottom_bar_screen.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  text:"User Login",
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
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'PK',
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        Get.to(BottomBarScreen());
                      },
                      child: const CustomTextWidget(
                       text:  "LOGIN",
                       color: Colors.white, fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(text: "Not registered yet? "),
                      GestureDetector(
                        onTap: () {
                          Get.to(const RegisterScreen());
                        },
                        child: CustomTextWidget(
                          text: "Register Now",
                          color: Colors.blue.shade900, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const CustomTextWidget(text: "OR", color: Colors.grey),
                  const Divider(),
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
    );
  }
}
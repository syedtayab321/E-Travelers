import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../Utils/app_colors.dart';

void showLogoutDialog(BuildContext context) {
  Get.defaultDialog(
    title: "",
    contentPadding: const EdgeInsets.all(20),
    backgroundColor: Colors.white,
    titlePadding: EdgeInsets.zero,
    content: Column(
      children: [
        const Icon(Icons.exit_to_app, size: 60, color: AppColors.primary),
        const SizedBox(height: 10),
        const CustomTextWidget(
          text: "Are you sure?",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        const SizedBox(height: 8),
        const CustomTextWidget(
          text: "Do you really want to log out? You will need to sign in again to access your account.",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              text: "Cancel",
              backgroundColor: Colors.grey[300]!,
              textColor: Colors.black,
              onPressed: () {
                Get.back();
              },
            ),
            CustomElevatedButton(
              text: "Logout",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Get.back();
                Get.snackbar("Logged Out", "You have been successfully logged out.",
                    backgroundColor: Colors.red, colorText: Colors.white);
                // Add your logout logic here
              },
            ),
          ],
        ),
      ],
    ),
  );
}

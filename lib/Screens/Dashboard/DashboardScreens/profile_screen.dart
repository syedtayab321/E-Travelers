import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/ProfileScreens/privacy_policy.dart';
import 'package:e_traverlers/Utils/logout_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextWidget(
                  text: "John Doe",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomTextWidget(
                  text: "john.doe@example.com",
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Profile Options List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [

                _buildProfileOption(
                  onPressed: () => Get.to(const PrivacyPolicyScreen()),
                  icon: FontAwesomeIcons.lock,
                  title: "Privacy Policy",
                ),
                _buildProfileOption(
                  onPressed: () => showLogoutDialog(context),
                  icon: FontAwesomeIcons.rightFromBracket,
                  title: "Logout",
                  isLogout: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({
    required VoidCallback onPressed,
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: isLogout ? Colors.red : AppColors.primaryDark,
              size: 20,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomTextWidget(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

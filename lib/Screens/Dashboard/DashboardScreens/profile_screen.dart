import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/ProfileScreens/account_settings_screen.dart';
import 'package:e_traverlers/Screens/ProfileScreens/help_support_screen.dart';
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: const BoxDecoration(
              color: AppColors.primary,
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
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                SizedBox(height: 10),
                CustomTextWidget(
                  text: "John Doe",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                CustomTextWidget(
                  text: "john.doe@example.com",
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileOption((){
                  Get.to(AccountSettingsScreen());
                },FontAwesomeIcons.user, "Account Settings"),
                const SizedBox(height: 20),
                _buildProfileOption((){
                  Get.to(const PrivacyPolicyScreen());
                },FontAwesomeIcons.lock, "Privacy Policy"),
                const SizedBox(height: 20),
                _buildProfileOption((){
                  Get.to(const HelpSupportScreen());
                },FontAwesomeIcons.circleQuestion, "Help & Support"),
                const SizedBox(height: 20),
                _buildProfileOption((){
                  Get.to(AccountSettingsScreen());
                },FontAwesomeIcons.gear, "Settings"),
                const SizedBox(height: 20),
                _buildProfileOption((){
                  showLogoutDialog(context);
                },FontAwesomeIcons.rightFromBracket, "Logout", isLogout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(VoidCallback onPressed, IconData icon, String title, {bool isLogout = false}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: FaIcon(icon, color: isLogout ? Colors.red : AppColors.primaryDark, size: 20),
        title: CustomTextWidget(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap:onPressed,
      ),
    );
  }
}

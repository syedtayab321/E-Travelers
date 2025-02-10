import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/app_colors.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import 'logout_dialog_box.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.primary,
      child: Column(
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem(
            icon: Icons.home,
            text: "Home",
            onTap: () => Get.toNamed('/home'),
          ),
          _buildDrawerItem(
            icon: Icons.flight_takeoff,
            text: "My Bookings",
            onTap: () => Get.toNamed('/bookings'),
          ),
          _buildDrawerItem(
            icon: Icons.local_offer,
            text: "Offers",
            onTap: () => Get.toNamed('/offers'),
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: "Settings",
            onTap: () => Get.toNamed('/settings'),
          ),
          const Divider(color: Colors.white54, thickness: 1),
          _buildDarkModeToggle(),
          const Spacer(),
          _buildLogoutButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
        ),
      ),
      accountName: CustomTextWidget(
        text: "John Doe",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      accountEmail: CustomTextWidget(
        text: "john.doe@example.com",
        fontSize: 14,
        color: Colors.white70,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, size: 50, color: AppColors.primary),
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 28),
      title: CustomTextWidget(text: text, fontSize: 16, color: Colors.white),
      onTap: onTap,
    );
  }

  Widget _buildDarkModeToggle() {
    return SwitchListTile(
      title: const CustomTextWidget(text: "Dark Mode", fontSize: 16, color: Colors.white),
      value: false,
      onChanged: (value) {
        // Implement dark mode logic
      },
      activeColor: AppColors.accent,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.exit_to_app, color: Colors.redAccent, size: 28),
      title: const CustomTextWidget(text: "Logout", fontSize: 16, color: Colors.redAccent),
      onTap: () {
        showLogoutDialog(context);
      },
    );
  }
}

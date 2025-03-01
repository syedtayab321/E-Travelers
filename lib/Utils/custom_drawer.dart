import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primary],
          ),
        ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const CustomTextWidget(
                text: "Guest User",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person, size: 50, color: Colors.black54),
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(FontAwesomeIcons.house, "Home"),
                  _buildDrawerItem(FontAwesomeIcons.infoCircle, "About Us"),
                  ExpansionTile(
                    leading: const Icon(FontAwesomeIcons.listCheck, color: Colors.white),
                    title: const CustomTextWidget(
                      text: "All Bookings",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      _buildSubDrawerItem(FontAwesomeIcons.plane, "Flight Booking"),
                      _buildSubDrawerItem(FontAwesomeIcons.hotel, "Hotel Booking"),
                      _buildSubDrawerItem(FontAwesomeIcons.bus, "Tour Booking"),
                      _buildSubDrawerItem(FontAwesomeIcons.passport, "Visa Booking"),
                    ],
                  ),
                  _buildDrawerItem(FontAwesomeIcons.history, "Booking History"),
                  _buildDrawerItem(FontAwesomeIcons.blog, "Blogs"),
                  _buildDrawerItem(FontAwesomeIcons.headset, "Support"),
                  _buildDrawerItem(FontAwesomeIcons.signInAlt, "Login"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: CustomTextWidget(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      onTap: () {},
    );
  }

  Widget _buildSubDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.white.withOpacity(0.8)),
        title: CustomTextWidget(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white.withOpacity(0.8),
        ),
        onTap: () {},
      ),
    );
  }
}
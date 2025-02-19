import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const CustomTextWidget(
                text: "Guest User",
                fontSize: 18, fontWeight: FontWeight.bold),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 50, color: Colors.black54),
            ),
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Expanded(
            child: ListView(
              children: [
                DrawerItem(icon: FontAwesomeIcons.house, title: "Home"),
                DrawerItem(icon: FontAwesomeIcons.infoCircle, title: "About Us"),

                ExpansionTile(
                  leading: const Icon(FontAwesomeIcons.listCheck, color: Colors.black54),
                  title: const CustomTextWidget(
                      text: "All Bookings", fontSize: 16, fontWeight: FontWeight.bold),
                  children: [
                    DrawerItem(icon: FontAwesomeIcons.plane, title: "Flight Booking", isSubItem: true),
                    DrawerItem(icon: FontAwesomeIcons.hotel, title: "Hotel Booking", isSubItem: true),
                    DrawerItem(icon: FontAwesomeIcons.bus, title: "Tour Booking", isSubItem: true),
                    DrawerItem(icon: FontAwesomeIcons.passport, title: "Visa Booking", isSubItem: true),
                  ],
                ),
                DrawerItem(icon: FontAwesomeIcons.history, title: "Booking History"),
                DrawerItem(icon: FontAwesomeIcons.compass, title: "Discover"),
                DrawerItem(icon: FontAwesomeIcons.blog, title: "Blogs"),
                DrawerItem(icon: FontAwesomeIcons.heart, title: "Wishlist"),
                DrawerItem(icon: FontAwesomeIcons.headset, title: "Support"),
                DrawerItem(icon: FontAwesomeIcons.signInAlt, title: "Login"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSubItem;

  DrawerItem({super.key, required this.icon, required this.title, this.isSubItem = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSubItem ? const SizedBox(width: 30) : Icon(icon, color: Colors.black54),
      title: CustomTextWidget(
       text:  title,
        fontSize: isSubItem ? 14 : 16, fontWeight: isSubItem ? FontWeight.normal : FontWeight.bold,
      ),
      onTap: () {},
    );
  }
}

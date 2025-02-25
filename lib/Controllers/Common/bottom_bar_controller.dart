import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/booking_history_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/contact_support_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/home_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    UniversalBookingScreen(),
    const ContactSupportScreen(),
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

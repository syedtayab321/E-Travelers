import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/cart_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/home_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/profile_screen.dart';
import 'package:e_traverlers/Screens/Dashboard/DashboardScreens/search_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> pages = [
    const HomeScreen(),
    SearchFilterScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Controllers/Common/bottom_bar_controller.dart';

class MainDashboardScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: controller.pages[controller.selectedIndex.value],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 8, spreadRadius: 2),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cartShopping),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
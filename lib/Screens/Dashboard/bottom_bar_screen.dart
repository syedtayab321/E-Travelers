import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Controllers/Common/bottom_bar_controller.dart';

class BottomBarScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  BottomBarScreen({super.key});

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
            backgroundColor: Colors.white,
            onTap: controller.changeTabIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendarCheck),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.headset),
                label: 'Support',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
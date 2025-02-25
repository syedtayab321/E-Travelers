import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Common/blog_top_bar_controller.dart';
import '../../Utils/app_colors.dart';

class BlogTopNavigationBarScreen extends StatelessWidget {
  final TopNavigationController controller = Get.put(TopNavigationController());

  final List<Map<String, dynamic>> tabs = [
    {"icon": Icons.article, "label": "All Blogs"},
    {"icon": Icons.computer, "label": "Technology"},
    {"icon": Icons.health_and_safety, "label": "Health & Wellness"},
    {"icon": Icons.attach_money, "label": "Finance"},
    {"icon": Icons.style, "label": "LifeStyle"},
    {"icon": Icons.travel_explore, "label": "Travel"},
    {"icon": Icons.menu_book, "label": "Education"},
    {"icon": Icons.fastfood, "label": "Food"},
    {"icon": Icons.business, "label": "Business"},
    {"icon": Icons.movie, "label": "Entertainment"},
    {"icon": Icons.science, "label": "Science"},
  ];

  BlogTopNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 60, // Set a fixed height for the navigation bar
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling
        child: Row(
          children: List.generate(tabs.length, (index) {
            bool isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10), // Adds spacing between tabs
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tabs[index]["icon"],
                      color: isSelected ? AppColors.primary : Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    CustomTextWidget(
                      text: tabs[index]["label"],
                      color: isSelected ? AppColors.primary : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    if (isSelected)
                      Container(
                        height: 2,
                        width: 40,
                        color: AppColors.primary,
                        margin: const EdgeInsets.only(top: 5),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    ));
  }
}

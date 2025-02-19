import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/BlogControllers/blog_top_bar_controller.dart';
import '../../Utils/app_colors.dart';

class BlogTopNavigationBarScreen extends StatelessWidget {
  final TopNavigationController controller = Get.put(TopNavigationController());

  final List<Map<String, dynamic>> tabs = [
    {"icon": Icons.article, "label": "All Blogs"},
    {"icon": Icons.fastfood, "label": "Food"},
    {"icon": Icons.flight_takeoff, "label": "Travelling"},
    {"icon": Icons.map, "label": "Travel Guide"},
  ];
   BlogTopNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(tabs.length, (index) {
        bool isSelected = controller.selectedIndex.value == index;
        return GestureDetector(
          onTap: () => controller.changeTab(index),
          child: Column(
            children: [
              Icon(
                tabs[index]["icon"],
                color: isSelected ? AppColors.primary : Colors.grey,
              ),
              const SizedBox(height: 4),
              CustomTextWidget(
                text:tabs[index]["label"],
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
        );
      }),
    ));
  }
}

import 'package:e_traverlers/Screens/BlogScreens/blog_top_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Common/blog_top_bar_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';

class MainBlogScreen extends StatelessWidget {
  final TopNavigationController controller = Get.put(TopNavigationController());
  MainBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomTextWidget(
          text: 'E Travelers Blogs',
          textAlign: TextAlign.center,
          fontSize: 18, fontWeight: FontWeight.bold,
        ),
        actions: const [
          Icon(Icons.share, color: AppColors.primary),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          _buildSearchBar(),
          const SizedBox(height: 10,),
          BlogTopNavigationBarScreen(),
          const SizedBox(height: 7,),
          Expanded(
            child: Obx(() => controller.pages[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search blog",
          prefixIcon: const Icon(Icons.search, color: AppColors.primary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

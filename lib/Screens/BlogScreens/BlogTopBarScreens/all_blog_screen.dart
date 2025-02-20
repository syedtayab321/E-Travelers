import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/DumyDataControllers/blog_controller.dart';
import '../../../Utils/app_colors.dart';

class AllBlogScreen extends StatelessWidget {
  final BlogController controller = Get.put(BlogController());
  AllBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: _buildBlogList()),
        ],
      );
  }

  Widget _buildBlogList() {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.blogs.length,
        itemBuilder: (context, index) {
          var blog = controller.blogs[index];
          return _buildBlogCard(
            blog['image']!,
            blog['category']!,
            blog['title']!,
            blog['description']!,
            blog['date']!,
          );
        },
      );
    });
  }

  Widget _buildBlogCard(String imageUrl, String category, String title, String desc, String date) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                 text:  category,
                 color: AppColors.primary, fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                CustomTextWidget(
                 text:  title, fontSize: 16, fontWeight: FontWeight.bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                CustomTextWidget(
                 text:  desc,
                 color: Colors.grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                    const SizedBox(width: 5),
                    CustomTextWidget(text: date,color: Colors.grey, fontSize: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

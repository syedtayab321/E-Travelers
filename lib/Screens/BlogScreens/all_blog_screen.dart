import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/BlogScreens/blog_Details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Controllers/BlogControllers/blog_controller.dart';
import '../../Utils/app_colors.dart';

class AllBlogScreen extends StatelessWidget {
  final String blogType;
  final BlogController controller = Get.put(BlogController());

  AllBlogScreen({super.key, required this.blogType});

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
      var filteredBlogs = controller.blogs
          .where((blog) => blog.blogType == blogType || blogType == "All Blogs")
          .toList();

      if (filteredBlogs.isEmpty) {
        return Center(
          child: CustomTextWidget(
            text: "No blogs found for $blogType",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        );
      }

      return ListView.builder(
        itemCount: filteredBlogs.length,
        itemBuilder: (context, index) {
          var blog = filteredBlogs[index];
          return InkWell(
             onTap: (){
               Get.to(
                 BlogDetailsScreen(
                   imageUrl: blog.image ?? "",
                   title: blog.title ?? "No Title",
                   content: blog.content ?? "No Description",
                   category: blog.blogType ?? "Unknown",
                   date: blog.createdAt.toString()?? "No Date",
               ));
             },
            child: _buildBlogCard(
              blog.image ?? "", // Ensure no null values
              blog.blogType ?? "Unknown",
              blog.title ?? "No Title",
              blog.content ?? "No Description",
              blog.createdAt.toString() ?? "No Date",
            ),
          );
        },
      );
    });
  }

  Widget _buildBlogCard(String imageUrl, String category, String title, String desc, String? date) {
    // Convert date to proper format
    String formattedDate = "No Date"; // Default text if date is null

    if (date != null && date.isNotEmpty) {
      try {
        DateTime parsedDate = DateTime.parse(date);
        formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
      } catch (e) {
        formattedDate = "Invalid Date"; // Handle parsing errors
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl.isNotEmpty ? imageUrl : "https://via.placeholder.com/100",
              width: 100, height: 100, fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: category,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                CustomTextWidget(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                CustomTextWidget(
                  text: desc,
                  color: Colors.grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                    const SizedBox(width: 5),
                    CustomTextWidget(
                      text: formattedDate,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
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

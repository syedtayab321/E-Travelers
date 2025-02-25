import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Controllers/RewviewsControllers/blog_review_controller.dart';
import '../../Utils/app_colors.dart';
import '../../CustomWidgets/custom_text_widget.dart';

class BlogDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String content;
  final String category;
  final String date;

  BlogDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.category,
    required this.date,
  });

  final ReviewController reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    String formattedDate = "No Date";
    if (date.isNotEmpty) {
      try {
        DateTime parsedDate = DateTime.parse(date);
        formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
      } catch (e) {
        formattedDate = "Invalid Date";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: "Blog Details",color: Colors.white,),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl.isNotEmpty ? imageUrl : "https://via.placeholder.com/400",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Category & Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  label: CustomTextWidget(
                    text: category,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    CustomTextWidget(
                      text: formattedDate,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Blog Title
            CustomTextWidget(
              text: title,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 12),

            // Blog Content
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextWidget(
                text: content,
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 30),

            // Review Section
            const Divider(thickness: 1.5, color: Colors.grey),
            const SizedBox(height: 15),

            const CustomTextWidget(
              text: "Submit Your Review",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            const SizedBox(height: 10),

            TextField(
              onChanged: (value) => reviewController.reviewText.value = value,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Write your review...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 15),

            // Submit Review Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: reviewController.addReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.send, size: 18, color: Colors.white),
                label: const Text("Submit Review", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),

            const SizedBox(height: 20),

            // Display Submitted Reviews
            const CustomTextWidget(
              text: "Reviews",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            const SizedBox(height: 10),

            Obx(() {
              return reviewController.reviews.isEmpty
                  ? const CustomTextWidget(
                text: "No reviews yet. Be the first to leave a review!",
                fontSize: 14,
                color: Colors.grey,
              )
                  : Column(
                children: reviewController.reviews.map((review) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextWidget(
                              text: review,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

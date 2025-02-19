import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Screens/BlogScreens/main_blog_screen.dart';
import '../../Screens/FlightScreens/flight_search_screen.dart';
import '../../Screens/HotelScreens/hotel_search_screen.dart';
import '../../Screens/TourScreens/tour_search_screen.dart';
import '../../Screens/VisaScreens/visa_search_screen.dart';
import '../../Utils/app_colors.dart';

class HomeCategorySection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.flight, "text": "FLIGHT", "screen": FlightSearchScreen()},
    {"icon": Icons.hotel, "text": "HOTEL", "screen": HotelSearchScreen()},
    {"icon": Icons.directions_car, "text": "TOUR", "screen": TourSearchScreen()},
    {"icon": Icons.card_travel, "text": "VISA", "screen": VisaSearchScreen()},
    // {"icon": Icons.explore, "text": "DISCOVER", "screen": FlightSearchScreen()},
    {"icon": Icons.article, "text": "BLOGS", "screen": MainBlogScreen()},
  ];

  HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(categories[index]["screen"]);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]["icon"], size: 40, color: AppColors.primary),
                const SizedBox(height: 8),
                CustomTextWidget(
                  text: categories[index]["text"],
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

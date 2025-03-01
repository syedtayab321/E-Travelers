import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Controllers/HotelControllers/hotel_search_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';
import 'hotel_details_screen.dart';

class HotelListScreen extends StatelessWidget {
  final HotelSearchController hotelController = Get.put(HotelSearchController());

  HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Hotels',
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Obx(() {
        if (hotelController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }
        if (hotelController.searchResults.isEmpty) {
          return const Center(
            child: CustomTextWidget(
              text: "No hotels found",
              fontSize: 18,
              color: Colors.grey,
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: hotelController.searchResults.length,
          itemBuilder: (context, index) {
            final hotel = hotelController.searchResults[index];
            return GestureDetector(
              onTap: () {
                Get.to(HotelDetailsScreen(hotelData: hotel,));
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                shadowColor: Colors.grey.withOpacity(0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        hotel.image,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Hotel Details
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hotel Name
                          CustomTextWidget(
                            text: hotel.name,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 5),

                          // Location
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationDot,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: CustomTextWidget(
                                  text: hotel.city,
                                  color: Colors.grey,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Price and Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: "\$${hotel.price.toStringAsFixed(2)}/night",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                                  const SizedBox(width: 5),
                                  CustomTextWidget(
                                    text: hotel.rating.toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
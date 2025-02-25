import 'package:e_traverlers/Controllers/HotelControllers/hotel_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCardScreen extends StatelessWidget {
  final HotelSearchController hotelController = Get.put(HotelSearchController());
  HotelCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
            text: 'Hotels',
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Obx(() {
        if (hotelController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.primary));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: hotelController.searchResults.length,
          itemBuilder: (context, index) {
            final hotel = hotelController.searchResults[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.network(
                          hotel.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                              const SizedBox(width: 5),
                              CustomTextWidget(
                                  text: hotel.rating.toString(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                            text: hotel.name,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.locationDot,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomTextWidget(
                                  text: hotel.location,
                                  color: Colors.grey,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                                text: '\$${hotel.pricePerNight.toString()}/night',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                              child: const CustomTextWidget(
                                  text: 'Book Now',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

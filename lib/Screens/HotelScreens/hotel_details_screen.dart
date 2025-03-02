import 'package:e_traverlers/CustomDialogBoxes/hotel_booking_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';
import '../../Modals/hotel_modal.dart';

class HotelDetailsScreen extends StatelessWidget {
  final HotelModel hotelData;
  const HotelDetailsScreen({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Hotel Details',
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              child: Image.network(
                hotelData.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Hotel Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel Name
                  CustomTextWidget(
                    text: hotelData.name,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextWidget(
                          text: hotelData.exactAddress,
                          color: Colors.grey,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Price
                  CustomTextWidget(
                    text: "Price: \$${hotelData.price.toStringAsFixed(2)}/night",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const CustomTextWidget(
                    text: "Description",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  CustomTextWidget(
                    text: hotelData.description,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),

                  // Amenities
                  const CustomTextWidget(
                    text: "Amenities",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: hotelData.amenities.split(',').map((amenity) {
                      return Chip(
                        label: CustomTextWidget(
                          text: amenity.trim(),
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        backgroundColor: AppColors.primary,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Features
                  const CustomTextWidget(
                    text: "Features",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: hotelData.features.map((feature) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.check, color: Colors.green, size: 16),
                            const SizedBox(width: 8),
                            CustomTextWidget(
                              text: feature,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Services
                  const CustomTextWidget(
                    text: "Services",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: hotelData.services.map((service) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.check, color: Colors.green, size: 16),
                            const SizedBox(width: 8),
                            CustomTextWidget(
                              text: service,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Contact Information
                  const CustomTextWidget(
                    text: "Contact Information",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  CustomTextWidget(
                    text: "Email: ${hotelData.email}",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  CustomTextWidget(
                    text: "Phone: ${hotelData.phone}",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  CustomTextWidget(
                    text: "Website: ${hotelData.website}",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),

                  // Book Now Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.dialog(HotelBookingDialog());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: const CustomTextWidget(
                        text: "Book Now",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
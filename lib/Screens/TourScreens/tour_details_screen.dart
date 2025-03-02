import 'package:e_traverlers/Screens/TourScreens/tour_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Modals/tour_modal.dart';
import '../../utils/app_colors.dart';

class TourDetailScreen extends StatelessWidget {
  final TourSearchModel tour;

  TourDetailScreen({super.key}) : tour = Get.arguments as TourSearchModel;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const CustomTextWidget(
          text: "Tour Details",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image with Gradient Overlay
            Stack(
              children: [
                Image.network(
                  tour.imageURL,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: tour.name,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          const SizedBox(width: 5),
                          CustomTextWidget(
                            text: tour.location,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Tour Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: "Price per Person",
                            fontSize: 16,
                            color: AppColors.accent,
                          ),
                          CustomTextWidget(
                            text: "${tour.pricePerPerson} PKR",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CustomTextWidget(
                            text: "Duration",
                            fontSize: 16,
                            color: AppColors.accent,
                          ),
                          CustomTextWidget(
                            text: tour.duration,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const CustomTextWidget(
                    text: "Description",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 10),
                  CustomTextWidget(
                    text: tour.description,
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 20),

                  // Included Services
                  const CustomTextWidget(
                    text: "Included Services",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 10),
                  ...tour.includedServices.map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.green, size: 16),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextWidget(
                            text: service,
                            fontSize: 14,
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 20),

                  // Excluded Services
                  const CustomTextWidget(
                    text: "Excluded Services",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 10),
                  ...tour.excludedServices.map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.red, size: 16),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextWidget(
                            text: service,
                            fontSize: 14,
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 5,
                  shadowColor: AppColors.primary.withOpacity(0.3),
                ),
                onPressed: () {
                  Get.to(TourBookingScreen());
                },
                child: const CustomTextWidget(
                  text: "Book Now",
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
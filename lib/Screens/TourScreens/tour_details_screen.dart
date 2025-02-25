import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Data/locatioN_images_list.dart';
import '../../Modals/tour_modal.dart';
import '../../utils/app_colors.dart';

class TourDetailScreen extends StatelessWidget {
  final TourSearchModel tour;

  TourDetailScreen({super.key}) : tour = Get.arguments as TourSearchModel;

  @override
  Widget build(BuildContext context) {
    String imagePath = LocationImages.images[tour.location] ??
        'https://example.com/images/default.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Tour Details",
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Stack(
              children: [
                Image.network(
                  imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: CustomTextWidget(
                    text: tour.name,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.accent),
                      const SizedBox(width: 5),
                      CustomTextWidget(
                        text: tour.location,
                        fontSize: 16,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Price
                  CustomTextWidget(
                    text: "Price per Person: ${tour.pricePerPerson} PKR",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 10),

                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: AppColors.primary),
                      const SizedBox(width: 5),
                      CustomTextWidget(
                        text: "Duration: ${tour.duration}",
                        fontSize: 16,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Description
                  const CustomTextWidget(
                    text: "Tour Description",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 5),
                  CustomTextWidget(
                    text: tour.description,
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 15),

                  // Included & Excluded Services
                  const CustomTextWidget(
                    text: "Included Services",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 5),
                  ...tour.includedServices.map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        const SizedBox(width: 5),
                        CustomTextWidget(
                          text: service,
                          fontSize: 14,
                          color: AppColors.accent,
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 10),

                  const CustomTextWidget(
                    text: "Excluded Services",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 5),
                  ...tour.excludedServices.map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.close, color: Colors.red),
                        const SizedBox(width: 5),
                        CustomTextWidget(
                          text: service,
                          fontSize: 14,
                          color: AppColors.accent,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Get.snackbar(
                    "Booking",
                    "Your booking request has been sent!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.primaryDark,
                    colorText: AppColors.textPrimary,
                  );
                },
                child: const CustomTextWidget(
                  text: "Book Now",
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

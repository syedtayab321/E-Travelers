import 'package:e_traverlers/Screens/TourScreens/tour_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Modals/tour_modal.dart';
import '../../utils/app_colors.dart';

class TourDataScreen extends StatelessWidget {
  final List<TourSearchModel> searchResults = Get.arguments ?? [];

  TourDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Search Tours",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: searchResults.isEmpty
          ? const Center(
        child: CustomTextWidget(
          text: "No tours found",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            TourSearchModel tour = searchResults[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              color: AppColors.background,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        tour.imageURL,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: tour.name,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 5),
                          CustomTextWidget(
                            text: "Location: ${tour.location}",
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(height: 5),
                          CustomTextWidget(
                            text: "Price: ${tour.pricePerPerson} PKR",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => TourDetailScreen(), arguments: tour);
                              },
                              child: const CustomTextWidget(
                                text: "View Details",
                                color: AppColors.textPrimary,
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
          },
        ),
      ),
    );
  }
}

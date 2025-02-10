import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/MainControllers/flight_controller.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';

class FlightDetailsScreen extends StatelessWidget {
  final FlightController flightController = Get.put(FlightController());
  FlightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var flight = flightController.selectedFlight;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Flight Details",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildFlightCard(flight),
              const SizedBox(height: 20),
              _buildFlightDetails(flight),
              const SizedBox(height: 30),
              _buildBookNowButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlightCard(Map<String, String> flight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                flight["flightLogo"]!,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: flight["flightName"]!,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
                CustomTextWidget(
                  text: flight["seatType"]!,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomTextWidget(
                text: flight["price"]!,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightDetails(Map<String, String> flight) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDetailRow("Departure", flight["departure"]!),
          _buildDetailRow("Destination", flight["destination"]!),
          _buildDetailRow("Date", flight["date"]!),
          _buildDetailRow("Time", flight["time"]!),
          _buildDetailRow("Duration", flight["duration"]!),
          _buildDetailRow("Gate", flight["gate"]!),
          _buildDetailRow("Terminal", flight["terminal"]!),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: label,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomTextWidget(
              text: value,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: CustomElevatedButton(
        text: "Book Now",
        backgroundColor: AppColors.accent,
        textColor: Colors.white,
        onPressed: () {
          Get.snackbar(
            "Booking Confirmed",
            "Your flight has been booked!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            borderRadius: 12,
            margin: const EdgeInsets.all(16),
            boxShadows: [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          );
        },
      ),
    );
  }
}
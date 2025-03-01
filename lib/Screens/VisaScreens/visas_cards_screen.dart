import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modals/visa_modal.dart';
import '../../Utils/app_colors.dart';

class VisaDetailsScreen extends StatelessWidget {
  final VisaDetailsModel visaDetails;

  const VisaDetailsScreen({super.key, required this.visaDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Hero(
          tag: 'visaDetailsTitle',
          child: Material(
            color: Colors.transparent,
            child: CustomTextWidget(
              text: "Visa Details",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Visa Details Card
                _buildVisaDetailsCard(),
                const SizedBox(height: 20),
                // Apply Now Button
                _buildApplyNowButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Visa Details Card
  Widget _buildVisaDetailsCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Destination Country
            _buildDetailItem(
              icon: Icons.flag,
              title: "Destination Country",
              value: visaDetails.destinationCountry ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Visa Type
            _buildDetailItem(
              icon: Icons.assignment,
              title: "Visa Type",
              value: visaDetails.type ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Duration
            _buildDetailItem(
              icon: Icons.calendar_today,
              title: "Duration",
              value: visaDetails.duration ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Requirements
            _buildDetailItem(
              icon: Icons.list,
              title: "Requirements",
              value: visaDetails.requirements ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Processing Time
            _buildDetailItem(
              icon: Icons.timer,
              title: "Processing Time",
              value: visaDetails.processingTime ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Fees
            _buildDetailItem(
              icon: Icons.attach_money,
              title: "Fees",
              value: visaDetails.fees ?? "N/A",
            ),
            const Divider(height: 20, thickness: 1, color: Colors.grey),
            // Additional Notes
            _buildDetailItem(
              icon: Icons.note,
              title: "Additional Notes",
              value: visaDetails.notes ?? "N/A",
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Detail Item Widget
  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 4),
                CustomTextWidget(
                  text: value,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Apply Now Button
  Widget _buildApplyNowButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          Get.snackbar("Apply Now", "Visa application process started!");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          shadowColor: AppColors.primary.withOpacity(0.3),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: "Apply Now",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
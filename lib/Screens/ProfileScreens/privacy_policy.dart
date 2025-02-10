import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../../../Utils/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 5,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: "Effective Date: Jan 1, 2024",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),

            _buildSection("Introduction",
                "Welcome to our Privacy Policy page. Your privacy is of utmost importance to us. This page outlines how we collect, use, and protect your information."),

            _buildSection("Information We Collect",
                "We collect personal data such as name, email, and location when you use our services. We also gather non-personal data like device information and app usage patterns."),

            _buildSection("How We Use Your Information",
                "Your data helps us improve user experience, provide personalized content, and enhance security measures."),

            _buildSection("Sharing of Information",
                "We do not sell your personal data. However, we may share data with third-party services to enhance our platform’s functionality."),

            _buildSection("Security Measures",
                "We implement strict security protocols to safeguard your information against unauthorized access and data breaches."),

            _buildSection("Your Rights & Choices",
                "You have the right to request access to your data, update your information, or request its deletion. Contact us for any data-related inquiries."),

            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: CustomTextWidget(
               text:  "For more information, contact us at support@example.com",
                textAlign: TextAlign.center,
               fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          const SizedBox(height: 5),
          CustomTextWidget(
            text: content,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
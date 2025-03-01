import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../../../Utils/app_colors.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  void _showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to take up more space
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              const CustomTextWidget(
                text: "Contact Support",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: "We're here to help! Choose an option below to get in touch.",
                fontSize: 14,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // WhatsApp Contact Card
              _buildContactCard(
                icon: FontAwesomeIcons.whatsapp,
                title: "WhatsApp Support",
                subtitle: "Chat with us on WhatsApp",
                color: Colors.green,
                onPressed: () {
                  _launchWhatsApp("+1234567890");
                },
              ),
              const SizedBox(height: 15),

              // Email Support Card
              _buildContactCard(
                icon: FontAwesomeIcons.envelope,
                title: "Email Support",
                subtitle: "Send us an email",
                color: Colors.blue,
                onPressed: () {
                  _launchEmail("support@example.com");
                },
              ),
              const SizedBox(height: 15),

              // Phone Call Card
              _buildContactCard(
                icon: FontAwesomeIcons.phone,
                title: "Call Support",
                subtitle: "Call us directly",
                color: Colors.orange,
                onPressed: () {
                  _launchPhoneCall("+1234567890");
                },
              ),
              const SizedBox(height: 20),

              // Close Button
              TextButton(
                onPressed: () => Get.back(),
                child: const CustomTextWidget(
                  text: "Close",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Reusable Contact Card Widget
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: FaIcon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: title,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 4),
                    CustomTextWidget(
                      text: subtitle,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp(String phoneNumber) async {
    final url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("Error", "Could not open WhatsApp", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _launchEmail(String email) async {
    final url = "mailto:$email";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("Error", "Could not open Email", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _launchPhoneCall(String phoneNumber) async {
    final url = "tel:$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("Error", "Could not make a call", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Contact Support",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showContactBottomSheet(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            shadowColor: AppColors.primary.withOpacity(0.3),
          ),
          child: const CustomTextWidget(
            text: "Contact Support",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
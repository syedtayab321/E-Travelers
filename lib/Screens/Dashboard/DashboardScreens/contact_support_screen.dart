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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomTextWidget(
                text: "Contact Support",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              const SizedBox(height: 15),

              // WhatsApp Contact Button
              _buildContactButton(
                icon: FontAwesomeIcons.whatsapp,
                title: "Contact via WhatsApp",
                color: Colors.green,
                onPressed: () {
                  _launchWhatsApp("+1234567890");
                },
              ),
              const SizedBox(height: 15),

              // Support Email Button
              _buildContactButton(
                icon: FontAwesomeIcons.envelope,
                title: "Email Support",
                color: Colors.blue,
                onPressed: () {
                  _launchEmail("support@example.com");
                },
              ),
              const SizedBox(height: 15),

              // Direct Call Button
              _buildContactButton(
                icon: FontAwesomeIcons.phone,
                title: "Call Support",
                color: Colors.orange,
                onPressed: () {
                  _launchPhoneCall("+1234567890");
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon, color: Colors.white),
      label: CustomTextWidget(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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

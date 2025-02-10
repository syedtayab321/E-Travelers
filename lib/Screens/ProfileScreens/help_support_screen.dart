import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../Utils/app_colors.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomTextWidget(
          text: "Help & Support",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: "How can we help you?",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for help topics...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const CustomTextWidget(
              text: "Frequently Asked Questions",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _faqItem("How to reset my password?", "Go to settings and click 'Reset Password'."),
                  _faqItem("How do I contact support?", "You can reach us via email or live chat."),
                  _faqItem("Can I change my email address?", "Yes, go to account settings to update your email."),
                  _faqItem("How do I delete my account?", "Contact support for account deletion requests."),
                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: "Contact Support",
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                onPressed: () {
                  Get.snackbar(
                    "Support",
                    "You can contact us at support@example.com",
                    backgroundColor: Colors.blue,
                    colorText: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _faqItem(String question, String answer) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: CustomTextWidget(
          text: question,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              text: answer,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey[700]!,
            ),
          ),
        ],
      ),
    );
  }
}

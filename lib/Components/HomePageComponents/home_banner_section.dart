import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.accent, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Get ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text: "3-in-1 ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: "Malaysia,\nThailand, Singapore ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "VISIT VISA!",
                            style: TextStyle(
                              color: Colors.yellow.shade300,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        elevation: 3,
                      ),
                      child: const CustomTextWidget(
                        text: "BOOK NOW",
                        color:AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/banner1.jpg",
                  height: 120,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

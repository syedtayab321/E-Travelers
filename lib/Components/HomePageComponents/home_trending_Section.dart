import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTrendingSearches extends StatelessWidget {
  const HomeTrendingSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Trending Searches",
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4),
        CustomTextWidget(
          text: "Here are some of the most famous destinations visited by tourists.",
          color: Colors.black54,
        ),
      ],
    );
  }
}

import 'package:e_traverlers/Components/HomePageComponents/top_section.dart';
import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../Components/HomePageComponents/category_section.dart';
import '../../../Components/HomePageComponents/popular_trip_Section.dart';
import '../../../Utils/app_colors.dart';
class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSection(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomTextWidget(
                  text: "Category",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary
              ),
            ),
            CategorySection(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomTextWidget(
                  text: "Popular Trip",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary
              ),
            ),
            PopularTripsSection(),
          ],
        ),
      ),
    );
  }
}

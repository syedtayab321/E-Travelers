import 'package:e_traverlers/Components/HomePageComponents/home_banner_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_category_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_destination_list_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_trending_Section.dart';
import 'package:e_traverlers/Utils/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../../../Utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Hello, ",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              TextSpan(
                text: "E Travelers",
                style: TextStyle(
                    color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeBannerSection(),
            const SizedBox(height: 20),
            HomeCategorySection(),
            const SizedBox(height: 20),
            const HomeTrendingSearches(),
            const SizedBox(height: 20),
            const HomeDestinationListSection(),
          ],
        ),
      ),
    );
  }
}

import 'package:e_traverlers/Components/HomePageComponents/home_app_bar_Component.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_banner_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_category_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_destination_list_section.dart';
import 'package:e_traverlers/Components/HomePageComponents/home_trending_Section.dart';
import 'package:e_traverlers/Utils/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppBarComponent(),
      ),
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

import 'package:e_traverlers/Controllers/Common/search_controller.dart';
import 'package:e_traverlers/CustomWidgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../../../Utils/app_colors.dart';

class SearchFilterScreen extends StatelessWidget {
  final SearchFilterController searchController = Get.put(SearchFilterController());

  SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 5,
        title: const CustomTextWidget(
         text:  "Search & Filter",
         fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
                ),
                child: CustomTextFormField(
                  onChanged: (value) => searchController.searchText.value = value,
                    hintText: "Search for trips...",
                    prefixIcon: Icons.search,
                    filled: true,
                    fillColor: Colors.white,
                      borderRadius: 30,
                      borderColor:Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              _buildFilterSection(
                title: "Select Category",
                child: Obx(() => Wrap(
                  spacing: 10,
                  children: searchController.categories.map((category) {
                    return ChoiceChip(
                      label: CustomTextWidget(text:category,fontSize: 16),
                      selected: searchController.selectedCategory.value == category,
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                          color: searchController.selectedCategory.value == category
                              ? Colors.white
                              : Colors.black),
                      elevation: 2,
                      onSelected: (selected) {
                        searchController.setCategory(selected ? category : "");
                      },
                    );
                  }).toList(),
                )),
              ),
              _buildFilterSection(
                title: "Price Range",
                child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(text:"\$${searchController.minPrice.value.toInt()}",
                            fontSize: 16, fontWeight: FontWeight.bold),
                        CustomTextWidget(text:"\$${searchController.maxPrice.value.toInt()}",
                          fontSize: 16, fontWeight: FontWeight.bold),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 4,
                        activeTrackColor: AppColors.primary,
                        thumbColor: AppColors.accent,
                      ),
                      child: RangeSlider(
                        values:
                        RangeValues(searchController.minPrice.value, searchController.maxPrice.value),
                        min: 0,
                        max: 1000,
                        divisions: 10,
                        labels: RangeLabels(
                          "\$${searchController.minPrice.value.toInt()}",
                          "\$${searchController.maxPrice.value.toInt()}",
                        ),
                        onChanged: (range) {
                          searchController.setPriceRange(range.start, range.end);
                        },
                      ),
                    ),
                  ],
                )),
              ),
              _buildFilterSection(
                title: "Minimum Rating",
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => searchController.setRating((index + 1).toDouble()),
                      child: Icon(
                        Icons.star,
                        size: 32,
                        color: (index + 1) <= searchController.minRating.value
                            ? Colors.amber
                            : Colors.grey[400],
                      ),
                    );
                  }),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: "Apply Filters",
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      Get.snackbar(
                        "Filters Applied",
                        "Your search filters have been applied!",
                        backgroundColor: Colors.green.withOpacity(0.9),
                        colorText: Colors.white,
                        icon: const Icon(Icons.check_circle, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection({required String title, required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text:title, fontSize: 18, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

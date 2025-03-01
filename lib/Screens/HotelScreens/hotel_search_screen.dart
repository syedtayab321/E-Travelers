import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/HotelControllers/hotel_search_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Data/lists_objects.dart';
import '../../Utils/app_colors.dart';

class HotelSearchScreen extends StatelessWidget {
  final HotelSearchController controller = Get.put(HotelSearchController());
  HotelSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const CustomTextWidget(
          text: "Find Your Stay",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCityDropdown(),
            const SizedBox(height: 16),
            _buildPriceRangeSelector(),
            const SizedBox(height: 16),
            _buildRatingSelector(),
            const SizedBox(height: 24),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "Destination", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Container(
          decoration: _boxShadowDecoration(),
          child: Obx(() => DropdownButtonFormField<String>(
            value: controller.selectedCity.value.isEmpty ? null : controller.selectedCity.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.location_on, color: AppColors.primary),
            ),
            hint: const CustomTextWidget(text: "Select a city"),
            items: pakistanCities.map((String city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.updateCity(value);
              }
            },
          )),
        ),
      ],
    );
  }

  Widget _buildPriceRangeSelector() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "Price Range (PKR)", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        RangeSlider(
          values: RangeValues(controller.minPrice.value, controller.maxPrice.value),
          min: 0,
          max: 50000, // Adjusted for PKR
          divisions: 10,
          labels: RangeLabels(
            "PKR ${controller.minPrice.value.toStringAsFixed(0)}",
            "PKR ${controller.maxPrice.value.toStringAsFixed(0)}",
          ),
          onChanged: (values) {
            controller.updateMinPrice(values.start);
            controller.updateMaxPrice(values.end);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Min: PKR ${controller.minPrice.value.toStringAsFixed(0)}",
                fontSize: 14,
                color: Colors.grey,
              ),
              CustomTextWidget(
                text: "Max: PKR ${controller.maxPrice.value.toStringAsFixed(0)}",
                fontSize: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildRatingSelector() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "Minimum Rating", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Slider(
          value: controller.minRating.value,
          min: 0,
          max: 5,
          divisions: 5,
          label: controller.minRating.value.toStringAsFixed(1),
          onChanged: (value) => controller.updateMinRating(value),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "0",
                fontSize: 14,
                color: Colors.grey,
              ),
              CustomTextWidget(
                text: "5",
                fontSize: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: () {
        controller.searchHotels();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
        elevation: 5,
        shadowColor: Colors.red.withOpacity(0.5),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(text: "SEARCH", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          SizedBox(width: 8),
          Icon(Icons.search, color: Colors.white),
        ],
      ),
    );
  }

  BoxDecoration _boxShadowDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
          offset: const Offset(2, 4),
        ),
      ],
    );
  }
}
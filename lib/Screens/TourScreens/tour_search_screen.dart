import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Controllers/TourControllers/tour_search_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';

class TourSearchScreen extends StatelessWidget {
  final TourSearchController controller = Get.put(TourSearchController());

  TourSearchScreen({super.key});

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
          text: "Explore Tours",
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
            _buildInputField("Destination", "Enter tour location", controller.updateDestination),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildTravelersAndTourTypeSelector(),
            const SizedBox(height: 24),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String placeholder, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Container(
          decoration: _boxShadowDecoration(),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: placeholder,
              prefixIcon: const Icon(Icons.explore, color: AppColors.primary),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: Get.context!,
          initialDate: controller.tourSearchModel.value.startDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
        if (picked != null) controller.updateStartDate(picked);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(text: "Start Date", fontWeight: FontWeight.bold),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: _boxShadowDecoration(),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                CustomTextWidget(
                  text: DateFormat('MMM dd, yyyy').format(controller.tourSearchModel.value.startDate),
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelersAndTourTypeSelector() {
    return Obx(() => Column(
      children: [
        _buildDropdownTile("Travelers", controller.tourSearchModel.value.travelers.toString(), List.generate(10, (index) => (index + 1).toString()), (value) => controller.updateTravelers(int.parse(value))),
        const SizedBox(height: 12),
        _buildDropdownTile("Tour Type", controller.tourSearchModel.value.tourType, ["Adventure", "Cultural", "Relaxation", "Historical"], (value) => controller.updateTourType(value)),
      ],
    ));
  }

  Widget _buildDropdownTile(String label, String currentValue, List<String> options, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Container(
          decoration: _boxShadowDecoration(),
          child: DropdownButtonFormField(
            value: currentValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            items: options.map((String value) {
              return DropdownMenuItem(value: value, child: CustomTextWidget(text: value));
            }).toList(),
            onChanged: (value) => onChanged(value as String),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
        elevation: 5,
        shadowColor: AppColors.primary.withOpacity(0.5),
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

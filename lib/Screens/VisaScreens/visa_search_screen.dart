import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import '../../Controllers/SearchControllers/visa_search_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';

class VisaSearchScreen extends StatelessWidget {
  final VisaSearchController controller = Get.put(VisaSearchController());

  VisaSearchScreen({super.key});

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
          text: "Visa Information",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
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
            _buildCountrySelector("Nationality", controller.updateNationality),
            const SizedBox(height: 16),
            _buildCountrySelector("Destination Country", controller.updateDestinationCountry),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildVisaTypeSelector(),
            const SizedBox(height: 24),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountrySelector(String label, Function(String) onSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold,color: AppColors.primary,),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: Get.context!,
              showPhoneCode: false,
              onSelect: (Country country) => onSelected(country.name),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: _boxShadowDecoration(),
            child: Row(
              children: [
                const Icon(Icons.flag, color: AppColors.primary),
                const SizedBox(width: 10),
                Obx(() => CustomTextWidget(
                  text: label == "Nationality"
                      ? controller.visaSearchModel.value.nationality
                      : controller.visaSearchModel.value.destinationCountry,
                  fontSize: 16,
                )),
              ],
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
          initialDate: controller.visaSearchModel.value.travelDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
        if (picked != null) controller.updateTravelDate(picked);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(text: "Travel Date", fontWeight: FontWeight.bold),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: _boxShadowDecoration(),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                CustomTextWidget(
                  text: DateFormat('MMM dd, yyyy').format(controller.visaSearchModel.value.travelDate),
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisaTypeSelector() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "Visa Type", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Container(
          decoration: _boxShadowDecoration(),
          child: DropdownButtonFormField(
            value: controller.visaSearchModel.value.visaType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            items: ["Tourist", "Business", "Student", "Work"].map((String type) {
              return DropdownMenuItem(value: type, child: Text(type));
            }).toList(),
            onChanged: (value) => controller.updateVisaType(value as String),
          ),
        ),
      ],
    ));
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

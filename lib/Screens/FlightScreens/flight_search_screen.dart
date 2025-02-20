import 'package:e_traverlers/Screens/FlightScreens/flight_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Controllers/SearchControllers/flight_search_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../Utils/app_colors.dart';

class FlightSearchScreen extends StatelessWidget {
  final FlightSearchController controller = Get.put(FlightSearchController());

  FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: "Book A Flight", fontWeight: FontWeight.bold),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTripTypeSelector(),
            const SizedBox(height: 20),
            _buildSearchCard(),
            const SizedBox(height: 20),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTripTypeSelector() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ["Round Trip", "One Way", "Multi City"].map((type) {
        return ChoiceChip(
          label: CustomTextWidget(
            text: type,
            fontWeight: FontWeight.bold,
            color: controller.flightSearchModel.value.tripType == type ? Colors.white : Colors.black,
          ),
          selected: controller.flightSearchModel.value.tripType == type,
          selectedColor: AppColors.primary,
          backgroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onSelected: (selected) => controller.updateTripType(type),
        );
      }).toList(),
    ));
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInputField("From", "Departure Airport or City", Icons.flight_takeoff, controller.updateDepartureCity),
          const SizedBox(height: 10),
          _buildInputField("To", "Arrival Airport or City", Icons.flight_land, controller.updateArrivalCity),
          const SizedBox(height: 10),
          _buildDateSelector(),
          const SizedBox(height: 10),
          _buildTravelerClassSelector(),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String placeholder, IconData icon, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: Icon(icon, color: AppColors.primary),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateTile("Depart Date", controller.flightSearchModel.value.departDate, controller.updateDepartDate),
        _buildDateTile("Return Date", controller.flightSearchModel.value.returnDate, controller.updateReturnDate),
      ],
    );
  }

  Widget _buildDateTile(String label, DateTime date, Function(DateTime) onUpdate) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: Get.context!,
          initialDate: date,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
        if (picked != null) onUpdate(picked);
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color:AppColors.primary, size: 18),
            const SizedBox(width: 8),
            CustomTextWidget(text: DateFormat('MMM dd, yyyy').format(date)),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelerClassSelector() {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(text: "Travelers: ${controller.flightSearchModel.value.travelers}"),
          CustomTextWidget(text: "Class: ${controller.flightSearchModel.value.travelClass}"),
        ],
      ),
    ));
  }

  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(FlightCardsScreen());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        elevation: 5,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(text: "SEARCH", color: Colors.white, fontWeight: FontWeight.bold),
          SizedBox(width: 8),
          Icon(Icons.search, color: Colors.white),
        ],
      ),
    );
  }
}

import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Controllers/BookingControllers/booking_history_controller.dart';
import '../../../Modals/booking_modal.dart';

class UniversalBookingScreen extends StatelessWidget {
  final UniversalBookingController controller =
      Get.put(UniversalBookingController());

  UniversalBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: "Booking History",color: Colors.white,),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.bookings.isEmpty) {
          return _buildNoDataView();
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                  "Flight Bookings", Icons.flight, controller.flightBookings),
              _buildSection(
                  "Hotel Bookings", Icons.hotel, controller.hotelBookings),
              _buildSection(
                  "Tour Bookings", Icons.tour, controller.tourBookings),
              _buildSection(
                  "Visa Bookings", Icons.assignment, controller.visaBookings),
            ],
          ),
        );
      }),
    );
  }

  // Build a section for a specific booking type
  Widget _buildSection(
      String title, IconData icon, List<UniversalBookingModel> bookings) {
    if (bookings.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              const SizedBox(width: 8),
              CustomTextWidget(
               text:  title,
               fontSize: 18, fontWeight: FontWeight.bold),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            UniversalBookingModel booking = bookings[index];
            return _buildBookingCard(booking);
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Build a booking card
  Widget _buildBookingCard(UniversalBookingModel booking) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getBookingIcon(booking.bookingType)),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextWidget(
                   text:  booking.serviceName,
                        fontSize: 16, fontWeight: FontWeight.bold),
                ),
                CustomTextWidget(
                  text: "\$${booking.price.toStringAsFixed(2)}",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextWidget(
              text: "Provider: ${booking.serviceProvider}",
              fontSize: 14,
              color: Colors.grey,
            ),
            const SizedBox(height: 4),
            CustomTextWidget(
              text: "Date: ${DateFormat('MMM dd, yyyy').format(booking.appointmentDate)}",
              fontSize: 14,
              color: Colors.grey,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const CustomTextWidget(
                    text: "Status: ", fontSize: 14, color: Colors.grey),
                CustomTextWidget(
                  text: booking.status,
                  fontSize: 14,
                  color: _getStatusColor(booking.status),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build no data view
  Widget _buildNoDataView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const CustomTextWidget(
            text: "No Bookings Available",
            fontSize: 18,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => controller.fetchAllBookings(),
            child: const Text("Refresh", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  // Get icon based on booking type
  IconData _getBookingIcon(String type) {
    switch (type) {
      case "Flight":
        return Icons.flight;
      case "Hotel":
        return Icons.hotel;
      case "Tour":
        return Icons.tour;
      case "Visa":
        return Icons.assignment;
      default:
        return Icons.directions_bus;
    }
  }

  // Get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case "Confirmed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

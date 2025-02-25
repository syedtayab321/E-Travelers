import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Controllers/BookingControllers/booking_history_controller.dart';
import '../../../Modals/booking_modal.dart';

class UniversalBookingScreen extends StatelessWidget {
  final UniversalBookingController controller = Get.put(UniversalBookingController());

  UniversalBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.bookings.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.bookings.length,
          itemBuilder: (context, index) {
            UniversalBookingModel booking = controller.bookings[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: ListTile(
                leading: Icon(_getBookingIcon(booking.bookingType), color: Colors.blueAccent),
                title: Text(booking.serviceName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Provider: ${booking.serviceProvider}"),
                    Text("Date: ${DateFormat('MMM dd, yyyy').format(booking.appointmentDate)}"),
                    Text("Status: ${booking.status}", style: TextStyle(color: _getStatusColor(booking.status))),
                  ],
                ),
                trailing: Text("\$${booking.price.toStringAsFixed(2)}"),
              ),
            );
          },
        );
      }),
    );
  }

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

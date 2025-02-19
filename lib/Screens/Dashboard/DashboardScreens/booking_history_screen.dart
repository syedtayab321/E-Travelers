import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/BookingControllers/booking_controller.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../../../Utils/app_colors.dart';

class BookingHistoryScreen extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Booking History',
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Obx(() {
        if (bookingController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: bookingController.bookings.length,
          itemBuilder: (context, index) {
            final booking = bookingController.bookings[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // Hotel Image on Left
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        booking.imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Hotel Booking Details on Right
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: booking.hotelName,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 14, color: Colors.grey),
                              const SizedBox(width: 5),
                              CustomTextWidget(
                                text: booking.location,
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          CustomTextWidget(
                            text: 'Check-in: ${booking.checkInDate}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                          CustomTextWidget(
                            text: 'Check-out: ${booking.checkOutDate}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                          CustomTextWidget(
                            text: 'Nights: ${_calculateNights(booking.checkInDate, booking.checkOutDate)}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                          CustomTextWidget(
                            text: 'Room Type: Deluxe',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                          const SizedBox(height: 6),

                          // Price & Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: '\$${booking.price.toString()}',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                              _statusWidget(booking.status),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // Booking Status Widget
  Widget _statusWidget(String status) {
    Color statusColor;
    if (status == "Confirmed") {
      statusColor = Colors.green;
    } else if (status == "Pending") {
      statusColor = Colors.orange;
    } else {
      statusColor = Colors.red;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomTextWidget(
        text: status,
        color: statusColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Calculate Nights Between Check-in and Check-out
  int _calculateNights(String checkIn, String checkOut) {
    DateTime checkInDate = DateTime.parse(_formatDate(checkIn));
    DateTime checkOutDate = DateTime.parse(_formatDate(checkOut));
    return checkOutDate.difference(checkInDate).inDays;
  }

  // Convert Date Format
  String _formatDate(String date) {
    List<String> parts = date.split(' ');
    String month = _monthToNumber(parts[1]);
    return "2025-$month-${parts[0]}";
  }

  // Convert Month Name to Number
  String _monthToNumber(String month) {
    Map<String, String> months = {
      "Jan": "01",
      "Feb": "02",
      "Mar": "03",
      "Apr": "04",
      "May": "05",
      "Jun": "06",
      "Jul": "07",
      "Aug": "08",
      "Sep": "09",
      "Oct": "10",
      "Nov": "11",
      "Dec": "12",
    };
    return months[month]!;
  }
}

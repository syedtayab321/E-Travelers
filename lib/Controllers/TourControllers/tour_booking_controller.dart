import 'package:e_traverlers/CustomDialogBoxes/payment_dialog.dart';
import 'package:e_traverlers/Utils/CustomSnakbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TourBookingController extends GetxController {
  // Tour details
  final String tourName = 'Explore the Grand Canyon';
  final String tourDescription =
      'Experience the breathtaking views of the Grand Canyon with our guided tour.';
  final double tourPrice = 199.99;
  final String tourDuration = '3 Days';

  // Booking form fields
  final RxString fullName = ''.obs;
  final RxString email = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxInt numberOfGuests = 1.obs;
  final RxString bookingDate = ''.obs;

  // Loading state
  final RxBool isLoading = false.obs;

  // Method to select booking date
  Future<void> selectBookingDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      bookingDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  // Method to submit the booking
  Future<void> submitBooking() async {
    if (fullName.isEmpty || email.isEmpty || phoneNumber.isEmpty || bookingDate.isEmpty) {
      showErrorSnackbar('Error', 'Please fill all fields');
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    Get.dialog(PaymentDialog());
  }
}
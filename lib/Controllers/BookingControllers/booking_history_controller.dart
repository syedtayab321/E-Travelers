import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modals/booking_modal.dart';

class UniversalBookingController extends GetxController {
  RxList<UniversalBookingModel> bookings = <UniversalBookingModel>[].obs;

  // Categorized bookings
  RxList<UniversalBookingModel> flightBookings = <UniversalBookingModel>[].obs;
  RxList<UniversalBookingModel> hotelBookings = <UniversalBookingModel>[].obs;
  RxList<UniversalBookingModel> tourBookings = <UniversalBookingModel>[].obs;
  RxList<UniversalBookingModel> visaBookings = <UniversalBookingModel>[].obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAllBookings();
    super.onInit();
  }

  Future<void> fetchAllBookings() async {
    try {
      isLoading(true);
      QuerySnapshot snapshot = await firestore
          .collection('bookings')
          .orderBy('bookingDate', descending: true)
          .get();

      bookings.value = snapshot.docs.map((doc) {
        return UniversalBookingModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      _categorizeBookings();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch bookings: $e", backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false); // Stop loading
    }
  }

  void _categorizeBookings() {
    flightBookings.value = bookings.where((booking) => booking.bookingType == "Flight").toList();
    hotelBookings.value = bookings.where((booking) => booking.bookingType == "Hotel").toList();
    tourBookings.value = bookings.where((booking) => booking.bookingType == "Tour").toList();
    visaBookings.value = bookings.where((booking) => booking.bookingType == "Visa").toList();
  }

  // Refresh bookings
  Future<void> refreshBookings() async {
    await fetchAllBookings();
  }
}
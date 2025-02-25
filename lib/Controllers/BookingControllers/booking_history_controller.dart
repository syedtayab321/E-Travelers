import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Modals/booking_modal.dart';

class UniversalBookingController extends GetxController {
  RxList<UniversalBookingModel> bookings = <UniversalBookingModel>[].obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchAllBookings();
    super.onInit();
  }

  // Fetch All Booking Histories from Firebase
  Future<void> fetchAllBookings() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('bookings').orderBy('bookingDate', descending: true).get();

      bookings.value = snapshot.docs.map((doc) {
        return UniversalBookingModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch bookings: $e");
    }
  }
}

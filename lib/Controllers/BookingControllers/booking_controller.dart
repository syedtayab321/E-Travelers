import 'package:get/get.dart';
import '../../Models/BookingModals/booking_modal.dart';

class BookingController extends GetxController {
  var isLoading = true.obs;
  var bookings = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookingHistory();
  }

  void fetchBookingHistory() async {
    await Future.delayed(const Duration(seconds: 2));
    bookings.value = [
      BookingModel(
        hotelName: "Grand Palace Hotel",
        location: "New York, USA",
        checkInDate: "12 Feb 2025",
        checkOutDate: "15 Feb 2025",
        price: 350.0,
        status: "Confirmed",
        imageUrl: "assets/images/hotel1.jpg",
      ),
      BookingModel(
        hotelName: "Ocean View Resort",
        location: "California, USA",
        checkInDate: "20 Feb 2025",
        checkOutDate: "25 Feb 2025",
        price: 500.0,
        status: "Pending",
        imageUrl: "assets/images/hotel1.jpg",
      ),
      BookingModel(
        hotelName: "Mountain Top Inn",
        location: "Colorado, USA",
        checkInDate: "05 Mar 2025",
        checkOutDate: "10 Mar 2025",
        price: 420.0,
        status: "Canceled",
        imageUrl: "assets/images/hotel1.jpg",
      ),
    ];
    isLoading.value = false;
  }
}

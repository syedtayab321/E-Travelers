import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Modals/hotel_modal.dart';

class HotelSearchController extends GetxController {
  var searchResults = <HotelModel>[].obs;
  var isLoading = false.obs;

  var selectedCity = "".obs;
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;
  var guests = 1.obs;
  var roomType = "Standard".obs;

  // Function to update search parameters
  void updateCity(String city) => selectedCity.value = city;
  void updateCheckInDate(DateTime date) => checkInDate.value = date;
  void updateCheckOutDate(DateTime date) => checkOutDate.value = date;
  void updateGuests(int guestCount) => guests.value = guestCount;
  void updateRoomType(String type) => roomType.value = type;

  // Fetch data from Firebase based on search filters
  Future<void> searchHotels() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('hotels')
          .where('location', isEqualTo: selectedCity.value)
          .where('roomType', isEqualTo: roomType.value)
          .where('guests', isGreaterThanOrEqualTo: guests.value)
          .get();

      searchResults.value =
          snapshot.docs.map((doc) => HotelModel.fromDocument(doc)).toList();
    } catch (e) {
      print("Error fetching hotels: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

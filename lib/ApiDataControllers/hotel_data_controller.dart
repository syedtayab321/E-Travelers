import 'package:get/get.dart';
import '../ApiDataModels/hotels_data_model.dart';
import '../Apis/hotel_data_api.dart';

class HotelDataController extends GetxController {
  var hotels = <HotelDataModel>[].obs;
  var isLoading = false.obs;

  // Fetch Hotels from API
  Future<void> fetchHotels() async {
    try {
      isLoading(true);
      var fetchedHotels = await HotelDataApi.fetchHotels();
      hotels.assignAll(fetchedHotels);
    } catch (e) {
      Get.snackbar("Error", "Failed to load hotels: $e");
    } finally {
      isLoading(false);
    }
  }

  // Search Hotels by Location & Date
  List<HotelDataModel> searchHotels(String location, DateTime checkIn, DateTime checkOut) {
    return hotels.where((hotel) =>
    hotel.location?.toLowerCase() == location.toLowerCase() &&
        (hotel.checkInDate?.isBefore(checkOut) ?? false) &&
        (hotel.checkOutDate?.isAfter(checkIn) ?? false)
    ).toList();
  }

  // Update Hotel Price (Admin Panel)
  Future<void> updateHotelPrice(String hotelId, double newPrice) async {
    bool success = await HotelDataApi.updateHotelPrice(hotelId, newPrice);
    if (success) {
      int index = hotels.indexWhere((hotel) => hotel.id == hotelId);
      if (index != -1) {
        hotels[index].pricePerNight = newPrice;
        hotels.refresh();
        Get.snackbar("Success", "Hotel price updated successfully");
      }
    } else {
      Get.snackbar("Error", "Failed to update price");
    }
  }

  // Add a new hotel (Admin Panel)
  Future<void> addHotel(HotelDataModel hotel) async {
    bool success = await HotelDataApi.addHotel(hotel);
    if (success) {
      hotels.add(hotel);
      Get.snackbar("Success", "Hotel added successfully");
    } else {
      Get.snackbar("Error", "Failed to add hotel");
    }
  }

  // Delete a hotel (Admin Panel)
  Future<void> deleteHotel(String hotelId) async {
    bool success = await HotelDataApi.deleteHotel(hotelId);
    if (success) {
      hotels.removeWhere((hotel) => hotel.id == hotelId);
      Get.snackbar("Success", "Hotel deleted successfully");
    } else {
      Get.snackbar("Error", "Failed to delete hotel");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchHotels();
  }
}

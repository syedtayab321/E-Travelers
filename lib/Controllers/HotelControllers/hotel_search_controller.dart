import 'package:get/get.dart';
import '../../Models/SearchModals/hotel_search_modal.dart';

class HotelSearchController extends GetxController {
  var hotelSearchModel = HotelSearchModel(
    city: '',
    checkInDate: DateTime.now(),
    checkOutDate: DateTime.now().add(const Duration(days: 1)),
    guests: 1,
    roomType: 'Standard',
  ).obs;

  void updateCity(String city) {
    hotelSearchModel.update((model) {
      model?.city = city;
    });
  }

  void updateCheckInDate(DateTime date) {
    hotelSearchModel.update((model) {
      model?.checkInDate = date;
    });
  }

  void updateCheckOutDate(DateTime date) {
    hotelSearchModel.update((model) {
      model?.checkOutDate = date;
    });
  }

  void updateGuests(int guests) {
    hotelSearchModel.update((model) {
      model?.guests = guests;
    });
  }

  void updateRoomType(String roomType) {
    hotelSearchModel.update((model) {
      model?.roomType = roomType;
    });
  }
}

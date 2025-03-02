import 'package:get/get.dart';

class HotelBookingController extends GetxController {
  // Observable for selected bed type
  var selectedBedType = ''.obs;

  // Method to update selected bed type
  void updateBedType(String? value) {
    if (value != null) {
      selectedBedType.value = value;
    }
  }
}
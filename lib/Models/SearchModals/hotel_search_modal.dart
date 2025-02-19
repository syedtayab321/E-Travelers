import 'package:get/get.dart';

class HotelSearchModel {
  String city;
  DateTime checkInDate;
  DateTime checkOutDate;
  int guests;
  String roomType;

  HotelSearchModel({
    required this.city,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guests,
    required this.roomType,
  });
}

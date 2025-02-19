import 'package:get/get.dart';

class TourSearchModel {
  String destination;
  DateTime startDate;
  int travelers;
  String tourType;

  TourSearchModel({
    required this.destination,
    required this.startDate,
    required this.travelers,
    required this.tourType,
  });
}

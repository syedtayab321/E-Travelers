import 'package:get/get.dart';

class FlightController extends GetxController {
  var selectedFlight = {
    "flightName": "Emirates",
    "departure": "New York (JFK)",
    "destination": "Dubai (DXB)",
    "date": "25 Jan 2025",
    "time": "10:30 AM",
    "duration": "14h 20m",
    "price": "\$450",
    "flightLogo": "assets/images/background3.jpg",
    "seatType": "Business Class",
    "gate": "A12",
    "terminal": "T3",
  }.obs;
}

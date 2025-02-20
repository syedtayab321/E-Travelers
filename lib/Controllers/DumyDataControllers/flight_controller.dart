import 'package:e_traverlers/ApiDataModels/flight_data_model.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  var flights = <FlightDataModal>[].obs;

  @override
  void onInit() {
    fetchFlights();
    super.onInit();
  }

  void fetchFlights() {
    flights.assignAll([
      FlightDataModal(
        airline: "Emirates",
        flightNumber: "EK-603",
        departureTime: "10:40 PM",
        arrivalTime: "06:30 AM",
        departureDate: "Feb 11, Tue",
        arrivalDate: "Feb 12, Wed",
        departureAirport: "KHI",
        arrivalAirport: "JED",
        stops: "1 Stop",
        duration: "9h 50m",
        price: double.parse("PKR 507,476"),
        refundable: true,
        seatsLeft: 9
      ),
      FlightDataModal(
        airline: "Emirates",
        flightNumber: "EK-806",
        departureTime: "11:10 AM",
        arrivalTime: "01:10 AM",
        departureDate: "Feb 12, Wed",
        arrivalDate: "Feb 13, Thu",
        departureAirport: "JED",
        arrivalAirport: "KHI",
        stops: "1 Stop",
        duration: "12h 0m",
        price: double.parse("PKR 507,476"),
        refundable: true,
        seatsLeft: 10
      ),
    ]);
  }
}

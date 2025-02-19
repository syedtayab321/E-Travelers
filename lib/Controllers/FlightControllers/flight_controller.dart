import 'package:get/get.dart';
import '../../Models/DataModels/flight_data_modal.dart';

class FlightController extends GetxController {
  var flights = <Flight>[].obs;

  @override
  void onInit() {
    fetchFlights();
    super.onInit();
  }

  void fetchFlights() {
    flights.assignAll([
      Flight(
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
        price: "PKR 507,476",
        refundable: true,
        seatsLeft: 9,
      ),
      Flight(
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
        price: "PKR 507,476",
        refundable: true,
        seatsLeft: 9,
      ),
    ]);
  }
}

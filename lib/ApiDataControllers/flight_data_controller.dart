import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../ApiDataModels/flight_data_model.dart';

class FlightController extends GetxController {
  var flights = <FlightDataModal>[].obs;
  var isLoading = false.obs;

  Future<void> fetchFlights() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://api.example.com/flights'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        flights.value = data.map((flight) => FlightDataModal.fromJson(flight)).toList();
      } else {
        Get.snackbar("Error", "Failed to load flights");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading(false);
    }
  }

  List<FlightDataModal> searchFlights(String departureCity, String arrivalCity, String date) {
    return flights.where((flight) =>
    (flight.departureCity?.toLowerCase() == departureCity.toLowerCase()) &&
        (flight.arrivalCity?.toLowerCase() == arrivalCity.toLowerCase()) &&
        (flight.departureTime?.contains(date) ?? false)
    ).toList();
  }

  void updateFlightPrice(String flightId, double newPrice) {
    int index = flights.indexWhere((flight) => flight.id == flightId);
    if (index != -1) {
      flights[index].price = newPrice;
      flights.refresh();
      Get.snackbar("Success", "Price updated successfully");
    } else {
      Get.snackbar("Error", "Flight not found");
    }
  }

  void addFlight(FlightDataModal newFlight) {
    flights.add(newFlight);
    Get.snackbar("Success", "Flight added successfully");
  }

  void deleteFlight(String flightId) {
    flights.removeWhere((flight) => flight.id == flightId);
    Get.snackbar("Success", "Flight deleted successfully");
  }

  @override
  void onInit() {
    super.onInit();
    fetchFlights();
  }
}

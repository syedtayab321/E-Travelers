import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Modals/flight_modal.dart';

class FlightSearchController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Observable flight search model
  Rx<FlightModel> flightSearchModel = FlightModel(
    tripType: "Round Trip",
    departureCity: "",
    arrivalCity: "",
    departDate: DateTime.now(),
    arrivalDate: DateTime.now().add(const Duration(days: 7)),
    travelers: 1,
    travelClass: "Economy",
    multiCityTrips: [],
  ).obs;

  // Observable list to store flight search results
  RxList<FlightModel> flights = <FlightModel>[].obs;

  /// **Update Trip Type**
  void updateTripType(String type) {
    flightSearchModel.update((val) {
      val?.tripType = type;
    });
  }

  /// **Update Departure City**
  void updateDepartureCity(String city) {
    flightSearchModel.update((val) {
      val?.departureCity = city;
    });
  }

  /// **Update Arrival City**
  void updateArrivalCity(String city) {
    flightSearchModel.update((val) {
      val?.arrivalCity = city;
    });
  }

  /// **Update Departure Date**
  void updateDepartDate(DateTime date) {
    flightSearchModel.update((val) {
      val?.departDate = date;
    });
  }

  /// **Update Return Date (for Round Trip)**
  void updateReturnDate(DateTime date) {
    flightSearchModel.update((val) {
      val?.arrivalDate = date;
    });
  }

  /// **Update Travelers Count**
  void updateTravelers(int count) {
    flightSearchModel.update((val) {
      val?.travelers = count;
    });
  }

  /// **Update Travel Class**
  void updateTravelClass(String travelClass) {
    flightSearchModel.update((val) {
      val?.travelClass = travelClass;
    });
  }

  /// **Multi-City: Add New Flight**
  void addMultiCityFlight() {
    flightSearchModel.update((val) {
      val?.multiCityTrips.add(MultiCityTrip(
        from: "",
        to: "",
        departDate: DateTime.now(),
      ));
    });
  }

  /// **Multi-City: Update Departure City**
  void updateMultiCityTrip(int index, String from) {
    flightSearchModel.update((val) {
      if (val != null && index >= 0 && index < val.multiCityTrips.length) {
        val.multiCityTrips[index] = MultiCityTrip(
          from: from,
          to: val.multiCityTrips[index].to,
          departDate: val.multiCityTrips[index].departDate,
        );
      }
    });
  }

  /// **Multi-City: Update Arrival City**
  void updateMultiCityArrival(int index, String to) {
    flightSearchModel.update((val) {
      if (val != null && index >= 0 && index < val.multiCityTrips.length) {
        val.multiCityTrips[index] = MultiCityTrip(
          from: val.multiCityTrips[index].from,
          to: to,
          departDate: val.multiCityTrips[index].departDate,
        );
      }
    });
  }

  /// **Multi-City: Update Departure Date**
  void updateMultiCityDepartDate(int index, DateTime date) {
    flightSearchModel.update((val) {
      if (val != null && index >= 0 && index < val.multiCityTrips.length) {
        val.multiCityTrips[index] = MultiCityTrip(
          from: val.multiCityTrips[index].from,
          to: val.multiCityTrips[index].to,
          departDate: date,
        );
      }
    });
  }

  /// **Multi-City: Remove a Flight**
  void removeMultiCityFlight(int index) {
    flightSearchModel.update((val) {
      if (val != null && index >= 0 && index < val.multiCityTrips.length) {
        val.multiCityTrips.removeAt(index);
      }
    });
  }

  /// **Store Flight Search Data in Firebase**
  Future<void> saveFlightSearch() async {
    try {
      await firestore.collection('flightSearches').add(flightSearchModel.value.toMap());
      Get.snackbar("Success", "Flight search data saved successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to save flight search data: $e");
    }
  }

  /// **Fetch Flights from Firebase**
  Future<void> fetchFlights() async {
    try {
      QuerySnapshot query = await firestore.collection('flightSearches').get();
      flights.assignAll(
        query.docs.map((doc) => FlightModel.fromMap(doc.data() as Map<String, dynamic>)).toList(),
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch flights: $e");
    }
  }
}

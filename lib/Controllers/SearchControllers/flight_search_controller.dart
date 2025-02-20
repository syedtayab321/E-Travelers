import 'package:get/get.dart';
import '../../Models/SearchModals/flight_search_model.dart';

class FlightSearchController extends GetxController {
  var flightSearchModel = FlightSearchModel(
    tripType: "Round Trip",
    departureCity: "",
    arrivalCity: "",
    departDate: DateTime.now(),
    returnDate: DateTime.now().add(Duration(days: 2)),
    travelers: 1,
    travelClass: "Economy",
  ).obs;

  void updateTripType(String type) {
    flightSearchModel.update((model) {
      model?.tripType = type;
    });
  }

  void updateDepartureCity(String city) {
    flightSearchModel.update((model) {
      model?.departureCity = city;
    });
  }

  void updateArrivalCity(String city) {
    flightSearchModel.update((model) {
      model?.arrivalCity = city;
    });
  }

  void updateDepartDate(DateTime date) {
    flightSearchModel.update((model) {
      model?.departDate = date;
    });
  }

  void updateReturnDate(DateTime date) {
    flightSearchModel.update((model) {
      model?.returnDate = date;
    });
  }

  void updateTravelers(int count) {
    flightSearchModel.update((model) {
      model?.travelers = count;
    });
  }

  void updateTravelClass(String travelClass) {
    flightSearchModel.update((model) {
      model?.travelClass = travelClass;
    });
  }
}

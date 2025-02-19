import 'package:get/get.dart';
import '../../Models/SearchModals/tour_search_modal.dart';

class TourSearchController extends GetxController {
  var tourSearchModel = TourSearchModel(
    destination: '',
    startDate: DateTime.now(),
    travelers: 1,
    tourType: 'Adventure',
  ).obs;

  void updateDestination(String destination) {
    tourSearchModel.update((model) {
      model?.destination = destination;
    });
  }

  void updateStartDate(DateTime date) {
    tourSearchModel.update((model) {
      model?.startDate = date;
    });
  }

  void updateTravelers(int travelers) {
    tourSearchModel.update((model) {
      model?.travelers = travelers;
    });
  }

  void updateTourType(String tourType) {
    tourSearchModel.update((model) {
      model?.tourType = tourType;
    });
  }
}

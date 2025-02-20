import 'package:get/get.dart';
import '../../Models/SearchModals/visa_search_model.dart';

class VisaSearchController extends GetxController {
  var visaSearchModel = VisaSearchModel(
    nationality: '',
    destinationCountry: '',
    travelDate: DateTime.now(),
    visaType: 'Tourist',
  ).obs;

  void updateNationality(String nationality) {
    visaSearchModel.update((model) {
      model?.nationality = nationality;
    });
  }

  void updateDestinationCountry(String destination) {
    visaSearchModel.update((model) {
      model?.destinationCountry = destination;
    });
  }

  void updateTravelDate(DateTime date) {
    visaSearchModel.update((model) {
      model?.travelDate = date;
    });
  }

  void updateVisaType(String visaType) {
    visaSearchModel.update((model) {
      model?.visaType = visaType;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Modals/visa_modal.dart';

class VisaSearchController extends GetxController {
  Rx<VisaSearchModel> visaSearchModel = VisaSearchModel(
    nationality: "Pakistan",
    destinationCountry: "United States",
    travelDate: DateTime.now(),
    visaType: "Tourist",
  ).obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Update nationality
  void updateNationality(String nationality) {
    visaSearchModel.update((model) {
      model?.nationality = nationality;
    });
  }

  // Update destination country
  void updateDestinationCountry(String country) {
    visaSearchModel.update((model) {
      model?.destinationCountry = country;
    });
  }

  // Update travel date
  void updateTravelDate(DateTime date) {
    visaSearchModel.update((model) {
      model?.travelDate = date;
    });
  }

  // Update visa type
  void updateVisaType(String visaType) {
    visaSearchModel.update((model) {
      model?.visaType = visaType;
    });
  }

  // Fetch Visa Information from Firebase
  Future<void> fetchVisaDetails() async {
    try {
      var snapshot = await firestore
          .collection('visaDetails')
          .where('nationality', isEqualTo: visaSearchModel.value.nationality)
          .where('destinationCountry', isEqualTo: visaSearchModel.value.destinationCountry)
          .where('visaType', isEqualTo: visaSearchModel.value.visaType)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data();
        visaSearchModel.value = VisaSearchModel.fromMap(data);
      } else {
        Get.snackbar("No Data", "No visa details found for selected filters.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch visa details: $e");
    }
  }
}

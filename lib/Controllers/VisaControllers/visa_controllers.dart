import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_traverlers/Screens/VisaScreens/visas_cards_screen.dart';
import 'package:get/get.dart';
import '../../Modals/visa_modal.dart';

class VisaSearchController extends GetxController {
  Rx<VisaDetailsModel> visaDetailsModel = VisaDetailsModel().obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateDestinationCountry(String country) {
    visaDetailsModel.update((model) {
      model?.destinationCountry = country;
    });
  }

  void updateVisaType(String visaType) {
    visaDetailsModel.update((model) {
      model?.type = visaType;
    });
  }

  Future<void> fetchVisaDetails() async {
    try {
      var snapshot = await firestore
          .collection('visas')
          .where('country', isEqualTo: visaDetailsModel.value.destinationCountry)
          .where('type', isEqualTo: visaDetailsModel.value.type)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data();
        visaDetailsModel.value = VisaDetailsModel.fromMap(data);
        Get.to(VisaDetailsScreen(visaDetails: visaDetailsModel.value ));
      } else {
        Get.snackbar("No Data", "No visa details found for selected filters.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch visa details: $e");
    }
  }
}
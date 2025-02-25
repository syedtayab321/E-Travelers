import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_traverlers/Screens/TourScreens/tour_data_screen.dart';
import 'package:get/get.dart';
import '../../Modals/tour_modal.dart';

class TourSearchController extends GetxController {
  var tourSearchModel = TourSearchModel(
    name: '',
    location: '',
    pricePerPerson: '',
    tourType: 'Adventure',
    description: '',
    startDate: DateTime.now(),
    duration: 'One Month',
    includedServices: [
      "Luxury Bus Transport",
      "Hotel Accommodation",
      "Daily Breakfast & Dinner",
      "Entry Tickets",
      "Tour Guide",
    ],
    excludedServices: [
      "Lunch Meals",
      "Personal Expenses",
      "Travel Insurance",
      "Emergency Medical Expenses",
    ],
  ).obs;

  var isLoading = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateLocation(String location) {
    tourSearchModel.update((model) {
      model?.location = location;
    });
  }

  void updateStartDate(DateTime date) {
    tourSearchModel.update((model) {
      model?.startDate = date;
    });
  }

  void updateTourType(String type) {
    tourSearchModel.update((model) {
      model?.tourType = type;
    });
  }

  // Search function to fetch tours from Firebase
  Future<void> searchTours() async {
    isLoading.value = true;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('tours')
          .where('location', isEqualTo: tourSearchModel.value.location)
          .where('tourType', isEqualTo: tourSearchModel.value.tourType)
          .get();

      List<TourSearchModel> results = querySnapshot.docs.map((doc) {
        return TourSearchModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      // Store fetched data in the model
      tourSearchModel.update((model) {
        // No searchResults field in TourModel, instead return a list separately.
      });
      Get.to(() => TourDataScreen(), arguments: results);

    } catch (e) {
      print("Error fetching tours: $e");
    }

    isLoading.value = false;
  }
}

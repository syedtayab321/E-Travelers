import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../ApiDataModels/tour_data_model.dart';

class TourDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var tourList = <TourDataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchTourData();
    super.onInit();
  }

  void fetchTourData() async {
    try {
      isLoading(true);
      QuerySnapshot snapshot = await _firestore.collection('TourData').get();
      var tours = snapshot.docs.map((doc) => TourDataModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
      tourList.assignAll(tours);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch tour data: $e");
    } finally {
      isLoading(false);
    }
  }
}

class TourSearchController extends GetxController {
  final TourDataController tourController = Get.find();
  var searchResults = <TourDataModel>[].obs;

  void searchTour(String query) {
    if (query.isEmpty) {
      searchResults.assignAll(tourController.tourList);
    } else {
      searchResults.assignAll(
        tourController.tourList.where((tour) =>
        tour.name!.toLowerCase().contains(query.toLowerCase()) ||
            tour.location!.toLowerCase().contains(query.toLowerCase()) ||
            tour.status!.toLowerCase().contains(query.toLowerCase())
        ).toList(),
      );
    }
  }
}

class TourAdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateTourPrice(String tourId, double newPrice) async {
    try {
      await _firestore.collection('TourData').doc(tourId).update({
        "price": newPrice,
      });
      Get.snackbar("Success", "Tour price updated successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to update tour price: $e");
    }
  }
}

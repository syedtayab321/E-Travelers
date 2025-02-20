import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../ApiDataModels/visa_data_model.dart';

class VisaController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var visaList = <VisaDataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchVisaData();
    super.onInit();
  }

  void fetchVisaData() async {
    try {
      isLoading(true);
      QuerySnapshot snapshot = await _firestore.collection('VisaData').get();
      var visas = snapshot.docs.map((doc) => VisaDataModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
      visaList.assignAll(visas);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch visa data: $e");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:e_traverlers/Utils/CustomSnakbars.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import '../../CustomDialogBoxes/payment_dialog.dart';

class VisaBookingController extends GetxController {
  // Form fields
  final RxString fullName = ''.obs;
  final RxString email = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString passportNumber = ''.obs;
  final RxString nationality = ''.obs;

  // Document upload
  final RxList<PlatformFile> uploadedDocuments = <PlatformFile>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  // Method to upload documents
  Future<void> uploadDocuments() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'],
      );

      if (result != null) {
        uploadedDocuments.addAll(result.files);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload documents: $e');
    }
  }

  // Method to submit the form
  Future<void> submitForm() async {
    if (fullName.isEmpty || email.isEmpty || phoneNumber.isEmpty || passportNumber.isEmpty || nationality.isEmpty) {
      showErrorSnackbar('Error', 'Please fill all fields');
      return;
    }

    if (uploadedDocuments.isEmpty) {
      showErrorSnackbar('Error', 'Please upload at least one document');
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.dialog(PaymentDialog());
  }
}
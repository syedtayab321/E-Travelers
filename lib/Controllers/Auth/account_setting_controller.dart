import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingsController extends GetxController {
  var username = "John Doe".obs;
  var email = "johndoe@example.com".obs;
  var phoneNumber = "+1234567890".obs;
  var password = "********".obs;
  var profileImage = "".obs;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
    }
  }
}
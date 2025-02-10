import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Auth/account_setting_controller.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../Utils/app_colors.dart';


class AccountSettingsScreen extends StatelessWidget {
  final AccountSettingsController settingsController = Get.put(AccountSettingsController());

  AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomTextWidget(
          text: "Account Settings",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            Obx(() => Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: settingsController.profileImage.value.isNotEmpty
                      ? AssetImage(settingsController.profileImage.value)
                      : const AssetImage("assets/images/default_profile.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: settingsController.pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(height: 20),

            // Editable User Details
            _editableField("Username", settingsController.username),
            _editableField("Email", settingsController.email),
            _editableField("Phone Number", settingsController.phoneNumber),
            _editableField("Password", settingsController.password, isPassword: true),

            const SizedBox(height: 30),
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: "Logout",
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Get.snackbar("Logout", "You have been logged out.",
                      backgroundColor: Colors.red, colorText: Colors.white);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editableField(String title, RxString value, {bool isPassword = false}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: CustomTextWidget(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: Obx(() => CustomTextWidget(
          text: isPassword ? "********" : value.value,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey[700]!,
        )),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            _showEditDialog(title, value);
          },
        ),
      ),
    );
  }

  void _showEditDialog(String title, RxString value) {
    TextEditingController controller = TextEditingController(text: value.value);

    Get.defaultDialog(
      title: "Edit $title",
      content: Column(
        children: [
          TextField(
            controller: controller,
            obscureText: title == "Password",
            decoration: InputDecoration(
              hintText: "Enter new $title",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
            text: "Save",
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
            onPressed: () {
              value.value = controller.text;
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

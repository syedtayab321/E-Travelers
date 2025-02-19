import 'package:e_traverlers/Controllers/Auth/user_more_details_controller.dart';
import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Dashboard/bottom_bar_screen.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class UserMoreDetailRegistration extends StatelessWidget {
  UserMoreDetailRegistration({super.key});

  final UserMoreDetailsController controller = Get.put(UserMoreDetailsController());
  final DOBController dobController = Get.put(DOBController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomTextWidget(text: "Profile", color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 60, color: Colors.grey),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 15,
                        child: Icon(Icons.edit, size: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildTextField("FULL NAME", "SYED TAYYAB"),
              const SizedBox(height: 10),
              buildTextField("EMAIL", "Type your email"),
              const SizedBox(height: 10),
              buildPhoneField(),
              const SizedBox(height: 10),
              buildNationalityDropdown(),
              const SizedBox(height: 10),
              buildGenderDropdown(),
              const SizedBox(height: 10),
              buildTextField("CNIC", "XXXXX-XXXXXXXX-X"),
              const SizedBox(height: 10),
              buildTextField("PASSPORT", "XXXXXXXXXXXX"),
              const SizedBox(height: 10),
              buildDOBField(context),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(BottomBarScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: const Center(
                  child: CustomTextWidget(
                      text: 'REGISTER',
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "PHONE NO", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            initialCountryCode: 'PK',
          ),
        ),
      ],
    );
  }

  Widget buildNationalityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "NATIONALITY", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          value: controller.selectedNationality.value,
          hint: const CustomTextWidget(text: "Select Country"),
          items: ["Pakistan", "India", "USA", "UK"]
              .map((country) => DropdownMenuItem(value: country, child: Text(country)))
              .toList(),
          onChanged: (value) {
            controller.updateNationality(value!);
          },
        )),
      ],
    );
  }

  Widget buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "GENDER", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          value: controller.selectedGender.value,
          hint: const CustomTextWidget(text: "Select Gender"),
          items: ["Male", "Female"]
              .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
              .toList(),
          onChanged: (value) {
            controller.updateGender(value!);
          },
        )),
      ],
    );
  }

  Widget buildDOBField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(text: "DATE OF BIRTH", fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        Obx(() => TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: dobController.selectedDate.value != null
                ? "${dobController.selectedDate.value!.day}-${dobController.selectedDate.value!.month}-${dobController.selectedDate.value!.year}"
                : "Select Date of Birth",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.red),
          ),
          onTap: () => dobController.selectDate(context),
        )),
      ],
    );
  }
}

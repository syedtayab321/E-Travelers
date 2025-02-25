import 'package:e_traverlers/Controllers/Auth/user_more_details_controller.dart';
import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/FirebaseFunctions/create_account.dart';
import 'package:e_traverlers/Screens/Dashboard/bottom_bar_screen.dart';
import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class UserMoreDetailRegistration extends StatefulWidget {

  final TextEditingController fullName;
  final TextEditingController email;
  final String password;
  const UserMoreDetailRegistration({super.key, required this.fullName, required this.email , required this.password});

  @override
  State<UserMoreDetailRegistration> createState() => _UserMoreDetailRegistrationState();
}

class _UserMoreDetailRegistrationState extends State<UserMoreDetailRegistration> {
  final UserMoreDetailsController controller = Get.put(UserMoreDetailsController());

  var isLoading = false.obs;

  final DOBController dobController = Get.put(DOBController());
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomTextWidget(text: "Create Account", color: Colors.black,fontSize: 20,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {},
        ),
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildTextField("FULL NAME",'Full Name Here',widget.fullName,TextInputType.text),
              const SizedBox(height: 10),
              buildTextField("EMAIL",'Email Here',widget.email,TextInputType.text),
              const SizedBox(height: 10),
              buildPhoneField(),
              const SizedBox(height: 10),
              buildNationalityDropdown(),
              const SizedBox(height: 10),
              buildGenderDropdown(),
              const SizedBox(height: 10),
              buildTextField("CNIC", "XXXXX-XXXXXXXX-X",cnicController,TextInputType.number),
              const SizedBox(height: 10),
              buildTextField("PASSPORT", "XXXXXXXXXXXX",passportController,TextInputType.text),
              const SizedBox(height: 10),
              buildDOBField(context),
              const SizedBox(height: 20),
              Obx((){
                return isLoading.value ? const CircularProgressIndicator() :
                ElevatedButton(
                  onPressed:() async{
                    isLoading.value=true;
                    try{
                      await registerUser(
                        fullName: widget.fullName.text,
                        email: widget.email.text,
                        password: widget.password,
                        phone: phoneNoController.text,
                        nationality: controller.selectedNationality.value!,
                        gender: controller.selectedGender.value!,
                        cnic: cnicController.text,
                        passport: passportController.text,
                        dob: dobController.selectedDate.value!,
                      );
                    }catch(e){
                      print(e.toString());
                    }finally{
                      isLoading.value=false;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Center(
                    child: CustomTextWidget(
                        text: 'REGISTER',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder, TextEditingController controller ,TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType:type ,
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
            controller: phoneNoController,
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
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today, color: Colors.red),
              onPressed: () => dobController.selectDate(context),
            ),
          ),
        )),
      ],
    );
  }
}

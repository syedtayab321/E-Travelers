import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMoreDetailsController extends GetxController {
  var selectedGender = RxnString();
  var selectedNationality = RxnString();

  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  void updateNationality(String nationality) {
    selectedNationality.value = nationality;
  }
}

class DOBController extends GetxController {
  var selectedDate = Rxn<DateTime>();

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_traverlers/Screens/HotelScreens/hotel_lists_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modals/hotel_modal.dart';

class HotelSearchController extends GetxController {
  var searchResults = <HotelModel>[].obs;
  var isLoading = false.obs;

  var selectedCity = "".obs;
  var minPrice = 0.0.obs;
  var maxPrice = 10000.0.obs;
  var minRating = 0.0.obs;

  // Function to update search parameters
  void updateCity(String city) => selectedCity.value = city;
  void updateMinPrice(double price) => minPrice.value = price;
  void updateMaxPrice(double price) => maxPrice.value = price;
  void updateMinRating(double rating) => minRating.value = rating;

  Future<void> searchHotels() async {
    try {
      isLoading.value = true;
      Query query = FirebaseFirestore.instance.collection('hotels');

      if (selectedCity.value.isNotEmpty) {
        query = query.where('city', isEqualTo: selectedCity.value);
      }

      query = query.where('price', isGreaterThanOrEqualTo: minPrice.value);
      query = query.where('price', isLessThanOrEqualTo: maxPrice.value);

      query = query.where('rating', isGreaterThanOrEqualTo: minRating.value);

      QuerySnapshot snapshot = await query.get();

      searchResults.value = snapshot.docs.map((doc) {
        return HotelModel.fromDocument(doc);
      }).toList();
      Get.to(HotelListScreen());
    } catch (e) {
      print("Error fetching hotels: $e");
      Get.snackbar("Error", "Failed to fetch hotels: $e", backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
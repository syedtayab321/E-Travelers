import 'package:get/get.dart';
import '../../Models/DataModels/hotel_data_modal.dart';
import 'dart:math';

class HotelController extends GetxController {
  var isLoading = true.obs;
  var hotels = <HotelModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHotels();
  }

  void fetchHotels() async {
    await Future.delayed(const Duration(seconds: 2));

    var random = Random();
    hotels.value = [
      HotelModel(
          name: 'Grand Hotel',
          location: 'New York',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 150.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
      HotelModel(
          name: 'Ocean View',
          location: 'California',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 200.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
      HotelModel(
          name: 'Mountain Resort',
          location: 'Colorado',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 180.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
    ];

    isLoading.value = false;
  }
}

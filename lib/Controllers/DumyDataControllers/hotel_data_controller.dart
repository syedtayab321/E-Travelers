import 'package:e_traverlers/ApiDataModels/hotels_data_model.dart';
import 'package:get/get.dart';
import 'dart:math';

class HotelController extends GetxController {
  var isLoading = true.obs;
  var hotels = <HotelDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHotels();
  }

  void fetchHotels() async {
    await Future.delayed(const Duration(seconds: 2));

    var random = Random();
    hotels.value = [
      HotelDataModel(
          hotelName: 'Grand Hotel',
          location: 'New York',
          imageUrl: 'assets/images/hotel1.jpg',
          pricePerNight: 150.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
      HotelDataModel(
          hotelName: 'Ocean View',
          location: 'California',
          imageUrl: 'assets/images/hotel1.jpg',
          pricePerNight: 200.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
      HotelDataModel(
          hotelName: 'Mountain Resort',
          location: 'Colorado',
          imageUrl: 'assets/images/hotel1.jpg',
          pricePerNight: 180.0,
          rating: (random.nextDouble() * 5).clamp(3.5, 5.0)),
    ];

    isLoading.value = false;
  }
}

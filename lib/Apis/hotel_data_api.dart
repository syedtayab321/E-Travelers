import 'package:http/http.dart' as http;
import 'dart:convert';
import '../ApiDataModels/hotels_data_model.dart';

class HotelDataApi {
  static const String baseUrl = "https://api.example.com/hotels";

  // Fetch all hotels from API
  static Future<List<HotelDataModel>> fetchHotels() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((hotel) => HotelDataModel.fromJson(hotel)).toList();
      } else {
        throw Exception("Failed to load hotels");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Update hotel price (Admin)
  static Future<bool> updateHotelPrice(String hotelId, double newPrice) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$hotelId'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"pricePerNight": newPrice}),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Add a new hotel (Admin)
  static Future<bool> addHotel(HotelDataModel hotel) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(hotel.toJson()),
      );

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  // Delete a hotel (Admin)
  static Future<bool> deleteHotel(String hotelId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$hotelId'));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

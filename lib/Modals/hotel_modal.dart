import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  String id;
  String name;
  String location;
  String imageUrl;
  double rating;
  int pricePerNight;
  List<String> amenities;
  String roomType;
  int guests;
  DateTime checkInDate;
  DateTime checkOutDate;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.pricePerNight,
    required this.amenities,
    required this.roomType,
    required this.guests,
    required this.checkInDate,
    required this.checkOutDate,
  });

  // Convert Firestore document to HotelModel
  factory HotelModel.fromDocument(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return HotelModel(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      pricePerNight: data['pricePerNight'] ?? 0,
      amenities: List<String>.from(data['amenities'] ?? []),
      roomType: data['roomType'] ?? '',
      guests: data['guests'] ?? 1,
      checkInDate: (data['checkInDate'] as Timestamp).toDate(),
      checkOutDate: (data['checkOutDate'] as Timestamp).toDate(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  final String id;
  final String city;
  final String name;
  final String description;
  final String amenities;
  final String exactAddress;
  final String email;
  final String phone;
  final String website;
  final String image;
  final double price;
  final double rating;
  final bool featured;
  final List<String> features;
  final List<String> services;

  HotelModel({
    required this.id,
    required this.city,
    required this.name,
    required this.description,
    required this.amenities,
    required this.exactAddress,
    required this.email,
    required this.phone,
    required this.website,
    required this.image,
    required this.price,
    required this.rating,
    required this.featured,
    required this.features,
    required this.services,
  });

  // Convert Firestore document to HotelModel
  factory HotelModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HotelModel(
      id: doc.id,
      city: data['city'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      amenities: data['amenities'] ?? '',
      exactAddress: data['exactAddress'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      website: data['website'] ?? '',
      image: data['image'] ?? '',
      price: (data['price'] as num).toDouble(),
      rating: (data['rating'] as num).toDouble(),
      featured: data['featured'] ?? false,
      features: List<String>.from(data['features'] ?? []),
      services: List<String>.from(data['services'] ?? []),
    );
  }
}
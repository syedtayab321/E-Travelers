class HotelDataModel {
  String? id;
  String? hotelName;
  String? location;
  double? pricePerNight;
  double? rating;
  List<String>? amenities;
  List<String>? images;
  String? description;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int? availableRooms;
  String? imageUrl;

  HotelDataModel({
    this.id,
    this.hotelName,
    this.location,
    this.pricePerNight,
    this.rating,
    this.amenities,
    this.images,
    this.description,
    this.checkInDate,
    this.checkOutDate,
    this.availableRooms,
    this.imageUrl,
  });

  // Convert JSON to Hotel Model
  factory HotelDataModel.fromJson(Map<String, dynamic> json) {
    return HotelDataModel(
      id: json['id'] ?? "",
      hotelName: json['name'] ?? "Unknown Hotel",
      location: json['location'] ?? "Unknown Location",
      pricePerNight: json['pricePerNight']?.toDouble() ?? 0.0,
      rating: json['rating'] ?? 0,
      amenities: List<String>.from(json['amenities'] ?? []),
      images: List<String>.from(json['images'] ?? []),
      description: json['description'] ?? "No description available",
      checkInDate: json['checkInDate'] != null ? DateTime.parse(json['checkInDate']) : null,
      checkOutDate: json['checkOutDate'] != null ? DateTime.parse(json['checkOutDate']) : null,
      availableRooms: json['availableRooms'] ?? 0,
      imageUrl: json['imageUrl'] ?? "https://via.placeholder.com/150",
    );
  }

  // Convert Hotel Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': hotelName,
      'location': location,
      'pricePerNight': pricePerNight,
      'rating': rating,
      'amenities': amenities,
      'images': images,
      'description': description,
      'checkInDate': checkInDate?.toIso8601String(),
      'checkOutDate': checkOutDate?.toIso8601String(),
      'availableRooms': availableRooms,
      'imageUrl': imageUrl,
    };
  }
}

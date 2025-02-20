class TourDataModel {
  String? id;             // Unique Tour ID
  String? name;           // Tour Name (e.g., Paris Adventure)
  String? location;       // Tour Location (e.g., France, Italy)
  double? price;          // Tour Price
  String? currency;       // Currency (e.g., USD, PKR)
  String? duration;       // Tour Duration (e.g., 5 Days, 10 Days)
  String? status;         // Tour Availability (e.g., Available, Fully Booked)
  String? description;    // Description of the Tour
  String? imageUrl;       // Tour Image URL
  List<String>? highlights; // Tour Highlights (e.g., Eiffel Tower Visit, Boat Ride)

  TourDataModel({
    this.id,
    this.name,
    this.location,
    this.price,
    this.currency,
    this.duration,
    this.status,
    this.description,
    this.imageUrl,
    this.highlights,
  });

  // Convert JSON to TourModel
  factory TourDataModel.fromJson(Map<String, dynamic> json) {
    return TourDataModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      price: (json['price'] != null) ? json['price'].toDouble() : null,
      currency: json['currency'] ?? '',
      duration: json['duration'] ?? '',
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      highlights: json['highlights'] != null ? List<String>.from(json['highlights']) : [],
    );
  }

  // Convert TourModel to JSON (For Storing & Updating)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "location": location,
      "price": price,
      "currency": currency,
      "duration": duration,
      "status": status,
      "description": description,
      "imageUrl": imageUrl,
      "highlights": highlights,
    };
  }
}

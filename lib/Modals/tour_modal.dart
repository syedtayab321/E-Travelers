class TourSearchModel {
  String name;
  String location;
  String pricePerPerson;
  String tourType;
  String description;
  DateTime startDate;
  final String duration;
  String imageURL;
  final List<dynamic> includedServices;
  final List<dynamic> excludedServices;

  TourSearchModel({
    required this.name,
    required this.location,
    required this.pricePerPerson,
    required this.tourType,
    required this.description,
    DateTime? startDate,
    required this.duration,
    required this.includedServices,
    required this.excludedServices,
    required this.imageURL,
  }) : startDate = startDate ?? DateTime.now();

  // Convert model to Map (for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'pricePerPerson': pricePerPerson,
      'tourType': tourType,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'duration': duration,
      'includedServices': includedServices,
      'excludedServices': excludedServices,
      'imageURL': imageURL,
    };
  }

  // Convert from Map (for Firebase)
  factory TourSearchModel.fromMap(Map<String, dynamic> map) {
    return TourSearchModel(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      pricePerPerson: map['pricePerPerson'] ?? '',
      tourType: map['tourType'] ?? 'Adventure',
      description: map['description'] ?? '',
      startDate: map['startDate'] != null
          ? DateTime.parse(map['startDate'])
          : DateTime.now(),
      duration: map['duration'] ?? '1 day',
      includedServices: map['includedServices'] ?? [],
      excludedServices: map['excludedServices'] ?? [],
      imageURL: map['imageURL'] ?? 'https://i.ytimg.com/vi/SnZDopmEGqs/maxresdefault.jpg',
    );
  }
}
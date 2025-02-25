class TourSearchModel {
  String name;
  String location;
  String pricePerPerson;
  String tourType;
  String description;
  DateTime startDate;
  final String duration;
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
  }) : startDate = startDate ?? DateTime.now();

  // Convert model to Map (for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'pricePerPerson': pricePerPerson,
      'tourType': tourType,
      'description': description,
      'startDate': startDate.millisecondsSinceEpoch,
      'duration': duration,
      'includedServices': includedServices,
      'excludedServices': excludedServices,
    };
  }

  // Convert from Map (for Firebase)
  factory TourSearchModel.fromMap(Map<String, dynamic> map, String id) {
    return TourSearchModel(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      pricePerPerson: map['pricePerPerson'] ?? '',
      tourType: map['tourType'] ?? 'Adventure',
      description: map['description'] ?? '',
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] ?? DateTime.now().millisecondsSinceEpoch),
      duration: map['duration'] ?? '1 day',
      includedServices: map['includedServices'] ?? [],
      excludedServices: map['excludedServices'] ?? [],
    );
  }
}

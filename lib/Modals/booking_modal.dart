class UniversalBookingModel {
  String id;
  String userId;
  String bookingType;
  String serviceName;
  String serviceProvider;
  DateTime bookingDate;
  DateTime appointmentDate;
  double price;
  String status;

  // Additional Fields (Depending on Booking Type)
  String? flightNumber;
  String? departureAirport;
  String? arrivalAirport;
  String? hotelName;
  int? numberOfNights;
  String? visaType;
  String? country;
  int? numberOfPersons;

  UniversalBookingModel({
    required this.id,
    required this.userId,
    required this.bookingType,
    required this.serviceName,
    required this.serviceProvider,
    required this.bookingDate,
    required this.appointmentDate,
    required this.price,
    required this.status,
    this.flightNumber,
    this.departureAirport,
    this.arrivalAirport,
    this.hotelName,
    this.numberOfNights,
    this.visaType,
    this.country,
    this.numberOfPersons,
  });

  // Convert Model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'bookingType': bookingType,
      'serviceName': serviceName,
      'serviceProvider': serviceProvider,
      'bookingDate': bookingDate.toIso8601String(),
      'appointmentDate': appointmentDate.toIso8601String(),
      'price': price,
      'status': status,
      'flightNumber': flightNumber,
      'departureAirport': departureAirport,
      'arrivalAirport': arrivalAirport,
      'hotelName': hotelName,
      'numberOfNights': numberOfNights,
      'visaType': visaType,
      'country': country,
      'numberOfPersons': numberOfPersons,
    };
  }

  // Factory method to create a model from Firestore snapshot
  factory UniversalBookingModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UniversalBookingModel(
      id: documentId,
      userId: map['userId'] ?? '',
      bookingType: map['bookingType'] ?? '',
      serviceName: map['serviceName'] ?? '',
      serviceProvider: map['serviceProvider'] ?? '',
      bookingDate: DateTime.parse(map['bookingDate'] ?? DateTime.now().toIso8601String()),
      appointmentDate: DateTime.parse(map['appointmentDate'] ?? DateTime.now().toIso8601String()),
      price: (map['price'] ?? 0).toDouble(),
      status: map['status'] ?? 'Pending',
      flightNumber: map['flightNumber'],
      departureAirport: map['departureAirport'],
      arrivalAirport: map['arrivalAirport'],
      hotelName: map['hotelName'],
      numberOfNights: map['numberOfNights'],
      visaType: map['visaType'],
      country: map['country'],
      numberOfPersons: map['numberOfPersons'],
    );
  }
}

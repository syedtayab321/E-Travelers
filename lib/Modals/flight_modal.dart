class FlightModel {
  String tripType; // One-Way, Round-Trip, Multi-City
  String departureCity;
  String? departureAirport;
  String arrivalCity;
  String? arrivalAirport;
  DateTime? departDate;
  DateTime? arrivalDate;
  int travelers;
  String travelClass;
  List<MultiCityTrip> multiCityTrips;

  // Flight Details
  double? price; // Ticket Price
  String? airline; // Airline Name
  String? flightNumber; // Flight Number
  String? duration; // Total Flight Duration
  String? departureTime; // Flight Departure Time
  String? arrivalTime; // Flight Arrival Time
  String? flightStatus; // Scheduled, Delayed, Canceled, etc.

  // Additional Information
  List<String>? layovers; // List of layover cities
  bool? isRefundable; // Refundable or Non-refundable
  bool? baggageIncluded; // Checked baggage included or not
  int? baggageWeight; // Allowed baggage weight in KG
  int? cabinBaggage; // Allowed cabin baggage weight in KG
  String? seatType; // Window, Aisle, Middle
  String? mealPreference; // Veg, Non-Veg, No Meal
  bool? wifiAvailable; // In-flight WiFi availability
  bool? entertainmentAvailable; // Entertainment system available

  String? flightId; // Unique ID (Firebase Document ID)

  /// **Constructor**
  FlightModel({
    required this.tripType,
    required this.departureCity,
    this.departureAirport,
    this.arrivalAirport,
    required this.arrivalCity,
    this.departDate,
    this.arrivalDate,
    required this.travelers,
    required this.travelClass,
    this.multiCityTrips = const [],
    this.price,
    this.airline,
    this.flightNumber,
    this.duration,
    this.departureTime,
    this.arrivalTime,
    this.flightStatus,
    this.layovers,
    this.isRefundable,
    this.baggageIncluded,
    this.baggageWeight,
    this.cabinBaggage,
    this.seatType,
    this.mealPreference,
    this.wifiAvailable,
    this.entertainmentAvailable,
    this.flightId,
  });

  /// **Convert to Map (for Firebase)**
  Map<String, dynamic> toMap() {
    return {
      'tripType': tripType,
      'departureCity': departureCity,
      'departureAirport': departureAirport,
      'arrivalCity': arrivalCity,
      'arrivalAirport': arrivalAirport,
      'departDate': departDate?.toIso8601String(),
      'returnDate': arrivalDate?.toIso8601String(),
      'travelers': travelers,
      'travelClass': travelClass,
      'multiCityTrips': multiCityTrips.map((trip) => trip.toMap()).toList(),
      'price': price,
      'airline': airline,
      'flightNumber': flightNumber,
      'duration': duration,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'flightStatus': flightStatus,
      'layovers': layovers,
      'isRefundable': isRefundable,
      'baggageIncluded': baggageIncluded,
      'baggageWeight': baggageWeight,
      'cabinBaggage': cabinBaggage,
      'seatType': seatType,
      'mealPreference': mealPreference,
      'wifiAvailable': wifiAvailable,
      'entertainmentAvailable': entertainmentAvailable,
      'flightId': flightId,
    };
  }

  /// **Convert from Firebase Map**
  factory FlightModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return FlightModel(
      tripType: map['tripType'],
      departureCity: map['departureCity'],
      departureAirport: map['departureAirport'],
      arrivalAirport: map['arrivalAirport'],
      arrivalCity: map['arrivalCity'],
      departDate: map['departDate'] != null ? DateTime.parse(map['departDate']) : null,
      arrivalDate: map['returnDate'] != null ? DateTime.parse(map['returnDate']) : null,
      travelers: map['travelers'],
      travelClass: map['travelClass'],
      multiCityTrips: (map['multiCityTrips'] as List?)
          ?.map((trip) => MultiCityTrip.fromMap(trip))
          .toList() ??
          [],
      price: map['price']?.toDouble(),
      airline: map['airline'],
      flightNumber: map['flightNumber'],
      duration: map['duration'],
      departureTime: map['departureTime'],
      arrivalTime: map['arrivalTime'],
      flightStatus: map['flightStatus'],
      layovers: (map['layovers'] as List?)?.map((e) => e.toString()).toList(),
      isRefundable: map['isRefundable'],
      baggageIncluded: map['baggageIncluded'],
      baggageWeight: map['baggageWeight'],
      cabinBaggage: map['cabinBaggage'],
      seatType: map['seatType'],
      mealPreference: map['mealPreference'],
      wifiAvailable: map['wifiAvailable'],
      entertainmentAvailable: map['entertainmentAvailable'],
      flightId: id ?? map['flightId'],
    );
  }
}

/// **Multi-City Flight Model**
class MultiCityTrip {
  String from;
  String to;
  DateTime? departDate;
  String? flightNumber;
  String? airline;
  String? duration;

  MultiCityTrip({
    required this.from,
    required this.to,
    this.departDate,
    this.flightNumber,
    this.airline,
    this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'departDate': departDate?.toIso8601String(),
      'flightNumber': flightNumber,
      'airline': airline,
      'duration': duration,
    };
  }

  factory MultiCityTrip.fromMap(Map<String, dynamic> map) {
    return MultiCityTrip(
      from: map['from'],
      to: map['to'],
      departDate: map['departDate'] != null ? DateTime.parse(map['departDate']) : null,
      flightNumber: map['flightNumber'],
      airline: map['airline'],
      duration: map['duration'],
    );
  }
}

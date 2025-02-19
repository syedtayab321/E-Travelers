class FlightSearchModel {
  String tripType;
  String departureCity;
  String arrivalCity;
  DateTime departDate;
  DateTime returnDate;
  int travelers;
  String travelClass;

  FlightSearchModel({
    required this.tripType,
    required this.departureCity,
    required this.arrivalCity,
    required this.departDate,
    required this.returnDate,
    required this.travelers,
    required this.travelClass,
  });

  factory FlightSearchModel.fromJson(Map<String, dynamic> json) {
    return FlightSearchModel(
      tripType: json['tripType'],
      departureCity: json['departureCity'],
      arrivalCity: json['arrivalCity'],
      departDate: DateTime.parse(json['departDate']),
      returnDate: DateTime.parse(json['returnDate']),
      travelers: json['travelers'],
      travelClass: json['travelClass'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripType': tripType,
      'departureCity': departureCity,
      'arrivalCity': arrivalCity,
      'departDate': departDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'travelers': travelers,
      'travelClass': travelClass,
    };
  }
}

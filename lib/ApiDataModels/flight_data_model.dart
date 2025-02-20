class FlightDataModal {
  String? id;               // Flight ID
  String? airline;          // Airline Name (e.g., Qatar Airways)
  String? flightNumber;     // Flight Number (e.g., QR786)
  String? departureCity;    // Departure City (e.g., Lahore)
  String? arrivalCity;      // Arrival City (e.g., Dubai)
  String? departureAirport; // Airport Name (e.g., Allama Iqbal Intl)
  String? arrivalAirport;   // Arrival Airport (e.g., Dubai Intl)
  String? departureDate;   // Dep arture Date (e.g., 2024-07-20)
  String? arrivalDate;   // Dep arture Date (e.g., 2024-07-20)
  String? departureTime;    // Departure Time (e.g., 10:30 AM)
  String? arrivalTime;      // Arrival Time (e.g., 02:45 PM)
  String? duration;         // Flight Duration (e.g., 4h 15m)
  int? availableSeats;      // Number of Available Seats
  String? seatClass;        // Seat Class (e.g., Economy, Business)
  double? price;            // Flight Price
  String? currency;         // Currency (e.g., USD, PKR)
  String? baggageAllowance; // Baggage Limit (e.g., 30KG)
  String? flightStatus;     // Flight Status (e.g., On Time, Delayed)
  String? gateNumber;       // Gate Number (e.g., A12)
  String? terminal;         // Terminal Number (e.g., T3)
  String? aircraftType;     // Aircraft Type (e.g., Boeing 777)
  String? mealService;      // Meal Service (e.g., Included, Not Included)
  String? wifiAvailability; // WiFi Available (Yes/No)
  String? bookingURL;       // URL for Booking Flight
  String? stops;       // Stops of Flight
  bool? refundable;
  double seatsLeft;
  FlightDataModal({
    this.id,
    this.airline,
    this.flightNumber,
    this.departureCity,
    this.arrivalCity,
    this.departureAirport,
    this.arrivalAirport,
    this.departureDate,
    this.arrivalDate,
    this.departureTime,
    this.arrivalTime,
    this.duration,
    this.availableSeats,
    this.seatClass,
    this.price,
    this.currency,
    this.baggageAllowance,
    this.flightStatus,
    this.gateNumber,
    this.terminal,
    this.aircraftType,
    this.mealService,
    this.wifiAvailability,
    this.bookingURL,
    this.stops,
    this.refundable,
    this.seatsLeft = 0,
  });

  // Convert JSON to Flight Model
  factory FlightDataModal.fromJson(Map<String, dynamic> json) {
    return FlightDataModal(
      id: json['id'] ?? '',
      airline: json['airline'] ?? '',
      flightNumber: json['flightNumber'] ?? '',
      departureCity: json['departureCity'] ?? '',
      arrivalCity: json['arrivalCity'] ?? '',
      departureAirport: json['departureAirport'] ?? '',
      arrivalAirport: json['arrivalAirport'] ?? '',
      departureDate: json['departureDate'] ?? '',
      arrivalDate: json['arrivalDate'] ?? '',
      departureTime: json['departureTime'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      duration: json['duration'] ?? '',
      availableSeats: json['availableSeats'] ?? 0,
      seatClass: json['seatClass'] ?? '',
      price: (json['price'] != null) ? json['price'].toDouble() : null,
      currency: json['currency'] ?? '',
      baggageAllowance: json['baggageAllowance'] ?? '',
      flightStatus: json['flightStatus'] ?? '',
      gateNumber: json['gateNumber'] ?? '',
      terminal: json['terminal'] ?? '',
      aircraftType: json['aircraftType'] ?? '',
      mealService: json['mealService'] ?? '',
      wifiAvailability: json['wifiAvailability'] ?? '',
      bookingURL: json['bookingURL'] ?? '',
      stops: json['stops'] ?? '',
      refundable: json['refundable'] ?? false,
      seatsLeft: json['seatsLeft'] ?? 0,
    );
  }

  // Convert Flight Model to JSON (For Updating)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "airline": airline,
      "flightNumber": flightNumber,
      "departureCity": departureCity,
      "arrivalCity": arrivalCity,
      "departureAirport": departureAirport,
      "arrivalAirport": arrivalAirport,
      "departureDate": departureDate,
      "arrivalDate": arrivalDate,
      "departureTime": departureTime,
      "arrivalTime": arrivalTime,
      "duration": duration,
      "availableSeats": availableSeats,
      "seatClass": seatClass,
      "price": price,
      "currency": currency,
      "baggageAllowance": baggageAllowance,
      "flightStatus": flightStatus,
      "gateNumber": gateNumber,
      "terminal": terminal,
      "aircraftType": aircraftType,
      "mealService": mealService,
      "wifiAvailability": wifiAvailability,
      "bookingURL": bookingURL,
      "stops": stops,
      "refundable": refundable,
      "seatsLeft": seatsLeft,
    };
  }
}

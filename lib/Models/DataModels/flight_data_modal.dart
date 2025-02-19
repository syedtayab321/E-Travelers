class Flight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final String departureAirport;
  final String arrivalAirport;
  final String stops;
  final String duration;
  final String price;
  final bool refundable;
  final int seatsLeft;

  Flight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.stops,
    required this.duration,
    required this.price,
    required this.refundable,
    required this.seatsLeft,
  });
}

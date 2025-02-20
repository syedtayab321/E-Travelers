class BookingModel {
  final String hotelName;
  final String location;
  final String checkInDate;
  final String checkOutDate;
  final double price;
  final String status;
  final String imageUrl;

  BookingModel({
    required this.hotelName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.status,
    required this.imageUrl,
  });
}

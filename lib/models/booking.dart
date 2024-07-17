class Booking {
  final String bookingID;
  final DateTime bookingDate;
  final String bookingStatus;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String totalAmount;

  Booking({
    required this.bookingID,
    required this.bookingDate,
    required this.bookingStatus,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.totalAmount,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingID: json['bookingID'],
      bookingDate: DateTime.parse(json['bookingDate']),
      bookingStatus: json['bookingStatus'],
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      customerPhone: json['customerPhone'],
      totalAmount: json['totalAmount'].toString(),
    );
  }
}
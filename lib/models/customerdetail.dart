class CustomerDetail {
  final String bookingID;
  final DateTime bookingDate;
  final String bookingStatus;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final int totalBookingRoom;
  final List<BookingDetail> bookingDetail;
  final String totalAmount;
  final String message;
  final dynamic paymentDetail; // assuming paymentDetail can be null or any type

  CustomerDetail({
    required this.bookingID,
    required this.bookingDate,
    required this.bookingStatus,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.totalBookingRoom,
    required this.bookingDetail,
    required this.totalAmount,
    required this.message,
    this.paymentDetail,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) {
    return CustomerDetail(
      bookingID: json['bookingID'],
      bookingDate: DateTime.parse(json['bookingDate']),
      bookingStatus: json['bookingStatus'],
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      customerPhone: json['customerPhone'],
      totalBookingRoom: json['totalBookingRoom'],
      bookingDetail: (json['bookingDetail'] as List)
          .map((detail) => BookingDetail.fromJson(detail))
          .toList(),
      totalAmount: json['totalAmount'].toString(),
      message: json['message'],
      paymentDetail: json['paymentDetail'],
    );
  }
}

class BookingDetail {
  final String roomInfo;
  final String dateInfo;
  final String amount;

  BookingDetail({
    required this.roomInfo,
    required this.dateInfo,
    required this.amount,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) {
    return BookingDetail(
      roomInfo: json['roomInfo'],
      dateInfo: json['dateInfo'],
      amount: json['amount'].toString(),
    );
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Booking> confirmVNPAYPayment(String bookingID) async {
  final url = 'https://apibeswp.bellybabe.site/api/Payment/Confirm-vnpay';
  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'bookingID': bookingID,
    'paymentMethod': 'VNPAY',
  });

  final response = await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return Booking.fromJson(jsonData);
  } else {
    throw Exception('Failed to confirm payment');
  }
}

class Booking {
  final String bookingID;
  final DateTime bookingDate;
  final String bookingStatus;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final int totalBookingRoom;
  final List<BookingDetail> bookingDetail;
  final int totalAmount;
  final String message;
  final PaymentDetail paymentDetail;

  Booking({
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
    required this.paymentDetail,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingID: json['bookingID'],
      bookingDate: DateTime.parse(json['bookingDate']),
      bookingStatus: json['bookingStatus'],
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      customerPhone: json['customerPhone'],
      totalBookingRoom: json['totalBookingRoom'] ?? 0,
      bookingDetail: json['bookingDetail']!= null
          ? (json['bookingDetail'] as List)
          .map((e) => BookingDetail.fromJson(e))
          .toList()
          : [],
      totalAmount: json['totalAmount'].toInt() ?? 0,
      message: json['message'] ?? '',
      paymentDetail: PaymentDetail.fromJson(json['paymentDetail']?? {}),
    );
  }
}

class BookingDetail {
  final String roomInfo;
  final String dateInfo;
  final int amount;

  BookingDetail({
    required this.roomInfo,
    required this.dateInfo,
    required this.amount,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) {
    return BookingDetail(
      roomInfo: json['roomInfo'],
      dateInfo: json['dateInfo'],
      amount: json['amount'],
    );
  }
}

class PaymentDetail {
  final DateTime date;
  final int amount;
  final String method;

  PaymentDetail({
    required this.date,
    required this.amount,
    required this.method,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      amount: json['amount'] != null ? json['amount'] as int : 0,
      method: json['method']!= null? json['method'] : '',
    );
  }
}
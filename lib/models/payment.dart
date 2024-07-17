import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> confirmVNPAYPayment() async {
  final url = Uri.parse('https://apibeswp.bellybabe.site/api/Payment/Confirm-vnpay');

  final jsonData = {
    "bookingID": "945PHAMB001",
    "paymentMethod": "VNPAY"
  };

  final response = await http.post(
    url,
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(jsonData),
  );

  if (response.statusCode == 200) {
    print('Payment confirmed successfully!');
  } else {
    print('Error confirming payment: ${response.statusCode}');
  }
}
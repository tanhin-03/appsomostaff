import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Customer {
  //... (same as before)
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String roomID;
  final DateTime dateIn;
  final DateTime dateOut;

  Customer(
      {required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.roomID,
        required this.dateIn,
        required this.dateOut});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      roomID: json['roomID'],
      dateIn: DateTime.parse(json['dateIn']),
      dateOut: DateTime.parse(json['dateOut']),
    );
  }

  // Future<void> bookRoom() async {
  //   final url = Uri.parse('https://apibeswp.bellybabe.site/api/bookings');
  //
  //   final json = {
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'email': email,
  //     'phone': phone,
  //     'roomID': roomID,
  //     'dateIn': dateIn.toIso8601String(),
  //     'dateOut': dateOut.toIso8601String(),
  //   };
  //
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(json),
  //   );
  //
  //   if (response.statusCode == 201) {
  //     print('Booking successful!');
  //   } else {
  //     throw Exception('Error booking room: ${response.statusCode}');
  //   }
  // }


  Future<String> bookRoom() async {
    final url = Uri.parse('https://apibeswp.bellybabe.site/api/bookings');

    final dateFormat = DateFormat('MM-dd-yyyy');

    final json = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'roomID': roomID,
      'dateIn': dateFormat.format(dateIn),
      'dateOut': dateFormat.format(dateOut),
    };

    print('JSON payload: $json');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(json),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody['bookingID']; // or whatever the key is
      } else {
        throw Exception('Error booking room: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }


}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_footer/Pages/bottom_navbar.dart';

class PaymentPage extends StatefulWidget {
  final String bookingID;

  PaymentPage({required this.bookingID});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  String _paymentMethod = '';

  Future<void> _confirmPayment() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = 'https://apibeswp.bellybabe.site/api/Payment/Confirm-vnpay';
      final headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        'bookingID': widget.bookingID,
        'paymentMethod': _paymentMethod,
      });

      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // Payment confirmed successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thanh toán thành công')),
        );
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred: ${response.statusCode}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Thông tin thanh toán',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mời nhập thông tin thanh toán';
                  }
                  return null;
                },
                onSaved: (value) => _paymentMethod = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _confirmPayment,
                child: Text('Xác nhận thanh toán'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                  );
                },
                child: Text('Quay lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
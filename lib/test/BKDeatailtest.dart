import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_footer/models/customerdetail.dart';

class CustomerDetailPage2 extends StatefulWidget {
  final String bookingID;

  CustomerDetailPage2({required this.bookingID});

  @override
  _CustomerDetailPage2State createState() => _CustomerDetailPage2State();
}

class _CustomerDetailPage2State extends State<CustomerDetailPage2> {
  CustomerDetail? bookingDetail;

  @override
  void initState() {
    super.initState();
    _fetchBookingDetails();
  }

  Future<void> _fetchBookingDetails() async {
    final response = await http.get(Uri.parse('https://apibeswp.bellybabe.site/api/bookings/${widget.bookingID}'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        bookingDetail = CustomerDetail.fromJson(jsonData);
      });
    } else {
      throw Exception('Failed to load booking details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin khách hàng'),
      ),
      body: bookingDetail != null
          ? Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text('Tên: ${bookingDetail!.customerName}',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 10),
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text('SĐT: ${bookingDetail!.customerPhone}',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 10),
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text('Ngày: ${bookingDetail!.bookingDetail[0].dateInfo}',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 10),
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text('Phòng: ${bookingDetail!.bookingDetail[0].roomInfo}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text('Tổng tiền: ${bookingDetail!.totalAmount}  VND',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 10),
            Container(
              width: 400, // fixed width
              constraints: BoxConstraints(maxWidth: 400), // fixed width
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white24,
              ),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text('${bookingDetail!.bookingStatus}',
                style: TextStyle(fontSize: 25, color: Colors.blue),),
            ),
            // ...
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
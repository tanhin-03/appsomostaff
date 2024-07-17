import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_footer/models/calenderBooking.dart';
import 'dart:convert';
import 'package:test_footer/Pages/bookroom.dart';

class BKCelanderDetailPage extends StatefulWidget {
  final String dayID;

  BKCelanderDetailPage({required this.dayID});

  @override
  _BKCelanderDetailPageState createState() => _BKCelanderDetailPageState();
}

class _BKCelanderDetailPageState extends State<BKCelanderDetailPage> {
  RoomData? bookingDetail;

  @override
  void initState() {
    super.initState();
    _fetchBookingDetails();
  }

  Future<void> _fetchBookingDetails() async {
    final response = await http.get(Uri.parse('https://apibeswp.bellybabe.site/api/dates/GetDatesByDayId/${widget.dayID}'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        bookingDetail = RoomData.fromJson(jsonData);
      });
    } else {
      throw Exception('Failed to load booking details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin và trạng thái phòng'),
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
              child: Text('ID booking: ${bookingDetail!.dayID}',
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
              child: Text('ID phòng: ${bookingDetail!.roomID}',
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
              child: Text('Tên phòng: ${bookingDetail!.roomName}',
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
              child: Text('Ngày: ${bookingDetail!.date}',
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
              child: Text('Giá: ${bookingDetail!.roomPrice} VND',
                style: TextStyle(fontSize: 20),
              ),
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
              child: GestureDetector(
                onTap: () {
                  if (bookingDetail!.roomStatus == 'Available') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerForm(roomID: '${bookingDetail!.roomID}',)),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('${bookingDetail!.roomStatus}',
                  style: TextStyle(
                    fontSize: 25,
                    color: bookingDetail!.roomStatus == 'Available'? Colors.green : Colors.red,
                  ),
                ),
              ),
            )
            // ...
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
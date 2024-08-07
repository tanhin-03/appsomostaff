import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_footer/models/calenderBookings.dart';
import 'package:test_footer/Pages/booking_celander_detail.dart';
import 'home_page.dart';

class CelanderPage extends StatefulWidget {
  const CelanderPage({super.key});

  @override
  State<CelanderPage> createState() => _CelanderPageState();
}

class _CelanderPageState extends State<CelanderPage> {
  DateTime? selectedDate;
  List<dynamic> customers = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2003),
      lastDate: DateTime(2160),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _searchCustomers() async {
    if (selectedDate != null) {
      customers = await _filterCustomersByDate(selectedDate!);
    } else {
      customers = await _getAllBookings();
    }
    setState(() {});
  }


  Future<List<RoomData>> _filterCustomersByDate(DateTime date) async {
    final selectedDate = date.toIso8601String().split('T').first;
    final url = 'https://apibeswp.bellybabe.site/api/dates/GetDatesByDateRange?dateFrom=$selectedDate&dateTo=$selectedDate';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final bookings = jsonData.map<RoomData>((jsonRoomData) => RoomData.fromJson(jsonRoomData)).toList();
      return bookings;
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  Future<List<RoomData>> _getAllBookings() async {
    final currentDate = DateTime.now().toIso8601String().split('T').first;
    final url = 'https://apibeswp.bellybabe.site/api/dates/GetDatesByDateRange?dateFrom=$currentDate&dateTo=$currentDate';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final bookings = jsonData.map<RoomData>((jsonRoomData) => RoomData.fromJson(jsonRoomData)).toList();
      return bookings;
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // "DATE" and "PASSENGERS"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      labelText: 'Chọn ngày',
                      labelStyle: const TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      suffixIcon: selectedDate != null
                          ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            selectedDate = null;
                          });
                        },
                      )
                          : null,
                    ),
                    controller: TextEditingController(
                      text: selectedDate != null
                          ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                          : '',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GradientButton(
              onPressed: () {
                _searchCustomers();
              },
              height: 55.0,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Tìm',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          customers.isEmpty
              ? Center(
            child: Text('Không có thông tin'),
          )
              : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BKCelanderDetailPage(dayID: customer.dayID),
                    ),
                  );
                },
                child: Card(
                  color: Colors.blueGrey[50],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên phòng : ${customer.roomName}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Giá: ${customer.roomPrice}  VND',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Trạng thái: ${customer.roomStatus}',
                          style: customer.roomStatus == 'Available'
                              ? TextStyle(fontSize: 20, color: Colors.green)
                              : TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

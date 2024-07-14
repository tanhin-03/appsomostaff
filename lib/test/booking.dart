import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_footer/Pages/booking_room.dart';
import 'package:test_footer/models/customer.dart';
import 'package:test_footer/Pages/customer_details.dart';
import '../Pages/home_page.dart';

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
      customers = await _getAllCustomers();
    }
    setState(() {});
  }

  Future<List<dynamic>> _filterCustomersByDate(DateTime date) async {
    final response =
        await http.get(Uri.parse('https://jsonserver-two.vercel.app/customer'));
    final jsonData = jsonDecode(response.body);
    final customers = jsonData['customers'];
    final filteredCustomers = customers.where((customer) {
      final dateIn = DateTime.parse(customer['dateIn']);
      final dateOut = DateTime.parse(customer['dateOut']);
      return date.isAfter(dateIn) &&
          date.isBefore(dateOut) ||
          date == dateIn ||
          date == dateOut;
    }).toList();
    return filteredCustomers;
  }

  Future<List<dynamic>> _getAllCustomers() async {
    final response =
        await http.get(Uri.parse('https://jsonserver-two.vercel.app/customer'));
    final jsonData = jsonDecode(response.body);
    return jsonData['customers'];
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
                              builder: (context) => CustomerDetailPage(
                                  customer: Customer.fromJson(customer))),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tên khách hàng : ${customer['lastName']}'),
                              SizedBox(height: 8),
                              Text('Email: ${customer['email']}'),
                              SizedBox(height: 8),
                              Text('Phòng: ${customer['roomID']}'),
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

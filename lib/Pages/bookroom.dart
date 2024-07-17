import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_footer/models/customer.dart';
import 'package:intl/intl.dart';
import 'package:test_footer/Pages/payment.dart';

class CustomerForm extends StatefulWidget {
  final String roomID;

  CustomerForm({required this.roomID});

  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _roomID = '';
  DateTime _dateIn = DateTime.now();
  DateTime _dateOut = DateTime.now().add(Duration(days: 1));


  @override
  void initState() {
    super.initState();
    _roomID = widget.roomID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Đặt một phòng')),
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tên',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                  onSaved: (value) => _firstName = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Họ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                  onSaved: (value) => _lastName = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ||!value.contains('@')) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'SĐT',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phone = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('ID phòng: ${widget.roomID}'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Ngày nhận :'),
                    SizedBox(width: 10),
                    ElevatedButton(
                      child: Text(DateFormat.yMd().format(_dateIn)),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _dateIn,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (date!= null) {
                          setState(() {
                            _dateIn = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Ngày trả:'),
                    SizedBox(width: 10),
                    ElevatedButton(
                      child: Text(DateFormat.yMd().format(_dateOut)),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _dateOut,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (date!= null) {
                          setState(() {
                            _dateOut = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text('Đặt phòng'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final customer = Customer(
                        firstName: _firstName,
                        lastName: _lastName,
                        email: _email,
                        phone: _phone,
                        roomID: _roomID,
                        dateIn: _dateIn,
                        dateOut: _dateOut,
                      );
                      customer.bookRoom().then((bookingID) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Room booked successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(bookingID: bookingID),
                          ),
                        );
                      }).catchError((e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error booking room: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
            ),
      );
  }
}
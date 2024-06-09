import 'package:flutter/material.dart';
import 'home_page.dart';
import 'room_test.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  // @override
  DateTime? selectedDate;

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

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children:[

            // "DATE" and "PASSENGERS"
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      controller: TextEditingController(
                        text: selectedDate != null
                            ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                            : '',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // const SizedBox(width: 16),
                  // Expanded(
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       labelText: 'Passengers',
                  //       hintText: "Number of passengers",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(16.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GradientButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ElysiumColony()));
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
                      'Search',
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}


import 'package:flutter/material.dart';
import 'home_page.dart';

class CelanderPage extends StatefulWidget {
  const CelanderPage({super.key});

  @override
  State<CelanderPage> createState() => _CelanderPageState();
}

class _CelanderPageState extends State<CelanderPage> {
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
                        labelText: 'Chọn ngày',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      controller:
                      TextEditingController(
                        text: selectedDate != null
                            ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                            : '',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GradientButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>  ElysiumColony(room: room)));
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Không tìm thấy phòng'),
                  //     ),
                  //   );
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_footer/models/customer.dart';
import 'package:intl/intl.dart';

class CustomerDetailPage extends StatelessWidget {
  final Customer customer;

  CustomerDetailPage({required this.customer});

  @override
  Widget build(BuildContext context) {
    bool paymentStatus = false;
    double displayWidth = MediaQuery.of(context).size.width;
    displayWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin khách hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(left: 16),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Tên:            '' ${customer.firstName} ${customer.lastName}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(
                left: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'SĐT:           '' ${customer.phone}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(
                left: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'E-mail:        '' ${customer.email}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(
                left: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Phòng:         ''${customer.roomID}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(
                left: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Ngày nhận: ${customer.dateIn.hour == 0
                    && customer.dateIn.minute == 0
                    && customer.dateIn.second == 0
                    ? '12:00 pm  - ' : DateFormat.jm().format(customer.dateIn)} '
                    '${DateFormat.yMd().format(customer.dateIn)}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: displayWidth * .9,
              padding: const EdgeInsets.only(
                left: 16,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0, color: Color(0x7F3951EE)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Ngày trả:    '' ${customer.dateOut.hour == 0
                    && customer.dateOut.minute == 0
                    && customer.dateOut.second == 0
                    ? '12:00 pm  - ' : DateFormat.jm().format(customer.dateOut)} '
                    '${DateFormat.yMd().format(customer.dateOut)}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),


            Column(
              children: [
                // Existing information box
                SizedBox(height: 16),

                // Additional information box for payment status
                Container(
                  width: displayWidth * 0.9,
                  height: 60,
                  padding: const EdgeInsets.only(left: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0x7F3951EE),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      paymentStatus? 'Đã thanh toán' : 'Chưa thanh toán',
                      style: TextStyle(
                        color: paymentStatus? Colors.green : Colors.red,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

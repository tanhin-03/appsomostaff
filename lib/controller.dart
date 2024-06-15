import 'package:flutter/material.dart';

Widget getStateWidget(int state) {
  switch (state) {
    case 1:
      return Center(
        child: Text(
          ' Thông tin\n'+'khách hàng',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    case 0:
      return Center(
        child: Text(
          'Book',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    default:
      return const Text(
        'Đang bảo trì',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
  }
}



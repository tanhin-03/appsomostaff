import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
import '../models/tent.dart';
import '../Pages/tent_view.dart';

class TentItem extends StatelessWidget {

  final HomestayTent tent;

  TentItem({required this.tent});

  @override
  Widget build(BuildContext context) {
    return LocationButton(
      imageAsset: 'assets/images/tent3.jpg',
      title: tent.roomName!,
      description: 'Điểm đến',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElysiumColony2(tent: tent),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
import '../Pages/room_view.dart';
import '../models/room.dart';

class RoomItem extends StatelessWidget {
  final HotelRoom room;

  RoomItem({required this.room});

  @override
  Widget build(BuildContext context) {
    return LocationButton(
      imageAsset: 'assets/images/gallery1.jpg',
      title: room.roomName!,
      description: 'Điểm đến',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElysiumColony(room: room),
          ),
        );
      },
    );
  }
}


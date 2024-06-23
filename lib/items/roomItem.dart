import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
// import '../Pages/room_view.dart';
import '../Pages/room_view.dart';
import '../models/room.dart';
import '../Pages/tent_view.dart';
// import '../views/roomtest2.dart';

class RoomItem extends StatelessWidget {
  final HotelRoom room;

  RoomItem({required this.room});

  @override
  Widget build(BuildContext context) {
    return LocationButton(
      imageAsset: 'assets/images/gallery1.jpg',
      title: room.roomName!,
      description: 'Destination',
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


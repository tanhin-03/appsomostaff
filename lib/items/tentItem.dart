import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
import '../Pages/room_view.dart';
import '../models/tent.dart';
import '../Pages/tent_view.dart';

class TentItem extends StatelessWidget {
//   HomestayTent? tent;
//   TentItem({this.tent});
//
//   @override
//   Widget build(BuildContext context) {
//     return new LocationButton(
//       imageAsset: 'assets/images/tent3.jpg',
//       title: tent!.roomName!,
//       description: 'Destination',
//       onTap: () {
// // Navigate to the related pages
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const ElysiumColony(room: room)));
//       },
//     );
//   }


  final HomestayTent tent;

  TentItem({required this.tent});

  @override
  Widget build(BuildContext context) {
    return LocationButton(
      imageAsset: 'assets/images/gallery1.jpg',
      title: tent!.roomName!,
      description: 'Destination',
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

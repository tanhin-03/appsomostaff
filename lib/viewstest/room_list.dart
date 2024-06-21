// import '../items/roomItem.dart';
// import '/models/room.dart';
// import '/data_sources/api_services.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class RoomListScreen extends StatefulWidget {
//   @override
//   _RoomListScreenState createState() => _RoomListScreenState();
// }
// class _RoomListScreenState extends State<RoomListScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Danh sách phòng"),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 10),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.height,
//         child: FutureBuilder<List<HotelRoom>>(
//           future: ApiRoom().fetchRoom(),
//           builder: (context, snapshot)
//           {
//             if((snapshot.hasError)||(!snapshot.hasData))
//               return Container(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             List<HotelRoom>? roomList = snapshot.data;
//             return ListView.builder(
//                 itemCount:roomList!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return RoomItem2(room: roomList[index],);
//                 }
//             );
//
//           },
//         ),
//
//       ),
//
//     );
//   }
// }
//
// class RoomItem extends StatelessWidget {
//   HotelRoom? room;
//   RoomItem({this.room});
//
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.only(top: 20.0),
//       child: new Row(
//         children: <Widget>[
//           new Container(
//             height: 50.0,
//             width: 50.0,
//             margin: new EdgeInsets.only(right: 10.0),
//             // child: new CircleAvatar(
//             //   backgroundImage: new NetworkImage(room!.description!),
//             // ),
//           ),
//           new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               new Text(
//                 room!.roomName! + " " + room!.description!,
//                 style: new TextStyle(
//                   fontSize: 10.0,
//                   color: Colors.black,
//                 ),
//               ),
//               new Container(
//                 margin: new EdgeInsets.only(top: 10.0),
//                 child: new Text(
//                   room!.typeID!,
//                   style: new TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

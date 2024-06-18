class HotelRoom {
  String? roomID;
  String? roomName;
  String? description;
  String? typeID;

  HotelRoom({this.roomID, this.roomName, this.description, this.typeID});

  HotelRoom.fromJson(Map<String, dynamic> json)
      : this.roomID = json['roomID'],
        this.roomName = json['roomName'],
        this.description = json['description'],
        this.typeID = json['typeID'];
}

class HotelRoomList {
  List<HotelRoom>? rooms;

  HotelRoomList({this.rooms});

  HotelRoomList.fromJson(Map<String, dynamic> json)
      : this.rooms = (json['rooms'] as List)
      .map((roomJson) => HotelRoom.fromJson(roomJson))
      .toList();
}


// {
// "rooms": [
// {
// "roomID": "R01",
// "roomName": "somofarm",
// "description": "A luxurious room with a king-size bed",
// "typeID": "DELUXE"
// },
// {
// "roomID": "T02",
// "roomName": "tent1",
// "description": "A cozy room with a queen-size bed",
// "typeID": "STANDARD"
// }
// ]
// }
class HomestayTent {
  String? roomID;
  String? roomName;
  String? description;
  String? typeID;

  HomestayTent({this.roomID, this.roomName, this.description, this.typeID});

  HomestayTent.fromJson(Map<String, dynamic> json)
      : this.roomID = json['roomID'],
        this.roomName = json['roomName'],
        this.description = json['description'],
        this.typeID = json['typeID'];
}

class HotelTentList {
  List<HomestayTent>? rooms;

  HotelTentList({this.rooms});

  HotelTentList.fromJson(Map<String, dynamic> json)
      : this.rooms = (json['rooms'] as List)
      .map((roomJson) => HomestayTent.fromJson(roomJson))
      .toList();

  List<HomestayTent>? getRoomsStartingWithT() {
    return rooms?.where((room) => room.roomID?.startsWith('T') ?? false).toList();
  }
}


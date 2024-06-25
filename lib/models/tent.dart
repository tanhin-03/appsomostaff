class HomestayTent {
  String? roomID;
  String? roomName;
  String? description;
  String? typeID;
  String? areaName;
  String? typeName;
  String? roomPrice;
  String? roomStatus;
  String? amenities;
  String? areaDetails;

  HomestayTent({
    this.roomID,
    this.roomName,
    this.description,
    this.typeID,
    this.areaName,
    this.typeName,
    this.roomPrice,
    this.roomStatus,
    this.amenities,
    this.areaDetails
  });

  HomestayTent.fromJson(Map<String, dynamic> json)
      : this.roomID = json['roomID'],
        this.roomName = json['roomName'],
        this.description = json['description'],
        this.typeID = json['typeID'],
        this.areaName = json['areaName'],
        this.typeName = json['typeName'],
        this.roomPrice = json['roomPrice'],
        this.roomStatus = json['roomStatus'],
        this.amenities = json['amenities'],
        this.areaDetails = json['areaDetails'];
}

class HotelTentList {
  List<HomestayTent>? rooms;

  HotelTentList({this.rooms});

  HotelTentList.fromJson(Map<String, dynamic> json)
      : this.rooms = (json['rooms'] as List)
            .map((roomJson) => HomestayTent.fromJson(roomJson))
            .toList();

  List<HomestayTent>? getRoomsStartingWithT() {
    return rooms
        ?.where((room) => room.roomID?.startsWith('T') ?? false)
        .toList();
  }
}

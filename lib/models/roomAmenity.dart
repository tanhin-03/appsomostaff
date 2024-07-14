class RoomAmenity {
  String? roomID;
  String? roomName;
  String? amenities;
  String? amenityName;

  RoomAmenity({
    this.roomID,
    this.roomName,
    this.amenities,
    this.amenityName
  });

  RoomAmenity.fromJson(Map<String, dynamic> json)
      : this.roomID = json['roomID'],
        this.roomName = json['roomName'],
        this.amenities = json['amenities'],
        this.amenityName = json['amenityName'];
}



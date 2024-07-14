class RoomDate {
  String? dayID;
  String? roomID;
  String? roomName;
  String? dates;
  double? roomPrice;
  String? roomStatus;

  RoomDate({
    this.dayID,
    this.roomID,
    this.roomName,
    this.dates,
    this.roomPrice,
    this.roomStatus

  });

  RoomDate.fromJson(Map<String, dynamic> json)
      : this.roomID = json['roomID'],
        this.roomName = json['roomName'],
        this.dayID = json['dayID'],
        this.dates = json['dates'],
        this.roomPrice = json['roomPrice']?.toDouble(),
        this.roomStatus = json['roomStatus']
      ;
}
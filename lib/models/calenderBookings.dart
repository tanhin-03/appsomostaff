class RoomData {
  String dayID;
  String roomID;
  String roomName;
  String dates;
  String roomPrice;
  String roomStatus;

  RoomData({
    required this.dayID,
    required this.roomID,
    required this.roomName,
    required this.dates,
    required this.roomPrice,
    required this.roomStatus,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      dayID: json['dayID'],
      roomID: json['roomID'],
      roomName: json['roomName'],
      dates: DateTime.parse(json['dates']).toString(),
      roomPrice: json['roomPrice'].toString(),
      roomStatus: json['roomStatus'],
    );
  }
}
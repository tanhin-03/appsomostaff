class RoomData {
  String dayID;
  String roomID;
  String roomName;
  String date;
  String roomPrice;
  String roomStatus;

  RoomData({
    required this.dayID,
    required this.roomID,
    required this.roomName,
    required this.date,
    required this.roomPrice,
    required this.roomStatus,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      dayID: json['dayID'],
      roomID: json['roomID'],
      roomName: json['roomName'],
      date: DateTime.parse(json['date']).toString(),
      roomPrice: json['roomPrice'].toString(),
      roomStatus: json['roomStatus'],
    );
  }
}
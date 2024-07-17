import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_footer/models/date.dart';
import 'package:test_footer/models/roomAmenity.dart';
import '../data_sources/api_services.dart';
import '../items/roomItem.dart';
import '../items/tentItem.dart';
import '../models/room.dart';
import '../models/tent.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> stationNames = [
    'Phòng Vương Quốc Đỏ',
    'Lều trại dã ngoại Glamping',
    'Phòng Dấu ấn Mang Thít',
    'Phòng Cửu Long',
  ];

  final TextEditingController _searchController = TextEditingController();

  void showSearchResults(BuildContext context) async {
    final String searchQuery = _searchController.text;

    // Assume you have a list of rooms
    List<HotelRoom> rooms = await ApiRoom().fetchRoom();

    // Filter the rooms based on the search query
    List<HotelRoom> filteredRooms = rooms
        .where((room) =>
            room.roomName!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    // Fetch the amenity information for each filtered room
    List<RoomAmenity> amenities =
        await Future.wait(filteredRooms.map((room) async {
      final response = await http.get(Uri.parse(
          'https://apibeswp.bellybabe.site/api/room-amenities/${room.roomID}'));
      if (response.statusCode == 200) {
        // return (jsonDecode(response.body) as List)
        //     .map((json) => RoomAmenity.fromJson(json))
        //     .first;
        final jsonData = jsonDecode(response.body);
        if (jsonData is Map<String, dynamic>) {
          final amenitiesJson = jsonData['amenities'] as List;
          return amenitiesJson.map((json) => RoomAmenity.fromJson(json)).first;
        } else {
          throw Exception('Invalid JSON data');
        }
      } else {
        throw Exception('Failed to load room amenities');
      }
    }));

    // Fetch the room price information for each filtered room
    List<RoomDate> roomPrices =
        await Future.wait(filteredRooms.map((room) async {
      final response = await http.get(Uri.parse(
          'https://apibeswp.bellybabe.site/api/dates/GetDatesByDateRange?dateFrom=2024-01-01&dateTo=2024-01-01'));
      if (response.statusCode == 200) {
        List<RoomDate> roomDates = (jsonDecode(response.body) as List)
            .map((json) => RoomDate.fromJson(json))
            .toList();
        return roomDates
            .firstWhere((roomDate) => roomDate.roomID == room.roomID);
      } else {
        throw Exception('Failed to load room prices');
      }
    }));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kết quả tìm kiếm.'),
        content: filteredRooms.isEmpty
            ? Text('Không tìm thấy phòng nào!')
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: filteredRooms.map((room) {
                    RoomAmenity? amenity =
                        amenities[filteredRooms.indexOf(room)];
                    RoomDate? roomPrice = roomPrices.firstWhere(
                        (roomPrice) => roomPrice.roomID == room.roomID);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(room.roomName!,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w900,
                              )),
                        ),
                        Text('ID phòng: ${room.roomID}.'),
                        Text('Khu vực: ${room.areaName}'),
                        Text('Giá: ${roomPrice?.roomPrice ?? 'Không có giá'}'),
                        Text(
                            'Tiện nghi: ${amenity?.amenityName ?? 'Không có tiện nghi'}'),
                        // Display the amenity name
                        // Add more features here
                      ],
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double accountButtonHeight = 75.0;
    double spaceBetweenButtons = 16.0;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 250,
                width: displayWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(displayWidth * 0.03),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      "Tìm phòng",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // "TO"
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Autocomplete<String>(
                        optionsBuilder: (textEditingValue) {
                          return stationNames.where((option) => option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        },
                        onSelected: (value) {},
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: _searchController,
                            // controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                            decoration: InputDecoration(
                              labelText: "Tên",
                              hintText: "Nhập tên phòng",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            onChanged: (text) {},
                            onSubmitted: (text) {},
                          );
                        },
                      ),
                    ),

                    // "SEARCH" button
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GradientButton(
                          onPressed: () {
                            if (_searchController.text.isNotEmpty) {
                              showSearchResults(context);
                            }
                          },
                          height: 55.0,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Tìm',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            // Best destinations container
            Padding(
              padding: EdgeInsets.symmetric(vertical: displayWidth * .05),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(50, 50, 50, 50),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(50, 50, 50, 50),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: displayWidth * .05,
                          vertical: displayWidth * .025),
                      child: Padding(
                        padding: EdgeInsets.only(top: displayWidth * .025),
                        child: Text(
                          'Danh sách phòng',
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                        child: FutureBuilder<List<HotelRoom>>(
                          future: ApiRoom().fetchRoom(),
                          // assume this is the API call
                          builder: (context, snapshot) {
                            if ((snapshot.hasError) || (!snapshot.hasData))
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            List<HotelRoom>? roomList = snapshot.data;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: roomList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (roomList[index].roomID != null &&
                                    roomList[index].roomID!.startsWith('R')) {
                                  return RoomItem(
                                    room: roomList[index],
                                  );
                                } else {
                                  return Container(); // or return an empty widget
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: displayWidth * .025),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: displayWidth * .05),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(50, 50, 50, 50),
                      // offset: Offset(0.0, 0.0),
                      blurRadius: 5,
                      // spreadRadius: 1,
                      // inset: true,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(50, 50, 50, 50),
                      // offset: Offset(0.0, 0.0),
                      blurRadius: 5,
                      // spreadRadius: 1,
                      // inset: true,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: displayWidth * .05,
                          vertical: displayWidth * .025),
                      child: Padding(
                        padding: EdgeInsets.only(top: displayWidth * .025),
                        child: Text(
                          'Danh sách lều',
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                        child: FutureBuilder<List<HomestayTent>>(
                          future: ApiTent().fetchTent(),
                          // assume this is the API call
                          builder: (context, snapshot) {
                            if ((snapshot.hasError) || (!snapshot.hasData))
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            List<HomestayTent>? tentList = snapshot.data;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tentList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (tentList[index].roomID != null &&
                                    tentList[index].roomID!.startsWith('T')) {
                                  return TentItem(
                                    tent: tentList[index],
                                  );
                                } else {
                                  return Container(); // or return an empty widget
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: displayWidth * .025),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width;
  final double height;
  final List<Color> colors;

  const GradientButton({
    required this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.colors = const [
      Color.fromRGBO(48, 0, 183, 1),
      Color.fromRGBO(161, 128, 255, 1)
    ],
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        // primary: Colors.transparent,
      ),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final VoidCallback onTap;

  const LocationButton({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLocationButtons(
      imageAsset: imageAsset,
      title: title,
      description: description,
      onTap: onTap,
    );
  }

  Widget _buildLocationButtons({
    required String imageAsset,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 0, 92, 46),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imageAsset,
                    width: 250,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),

                // Description and Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LongButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final Color backgroundColor;
  final VoidCallback onTap;

  const LongButton({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: displayWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(displayWidth * .04),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(displayWidth * .03),
            splashColor: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth * .03,
                  vertical: displayWidth * .025),
              child: Row(
                children: [
                  Image.asset(
                    imageAsset,
                    width: displayWidth * .22,
                    height: displayWidth * .22,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: displayWidth * .05),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: displayWidth * .0125),
                        Text(
                          description,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: displayWidth * .06,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

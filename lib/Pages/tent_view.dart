import 'package:flutter/material.dart';
import '../models/tent.dart';
import '/pages/bottom_navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ElysiumColony2 extends StatefulWidget {
  final HomestayTent tent;

  ElysiumColony2({required this.tent});

  @override
  _ElysiumColony2State createState() => _ElysiumColony2State();
}

class _ElysiumColony2State extends State<ElysiumColony2> {
  int _selectedImageIndex = 0;
  final List<String> _imageUrls = [
    'assets/images/tent1.jpg',
    'assets/images/tent2.jpg',
    'assets/images/tent3.jpg',
    'assets/images/tent4.jpg',
    'assets/images/tent5.jpg',
  ];



  double? _roomPrice;

  @override
  void initState() {
    super.initState();
    _fetchRoomPrice();
  }

  Future<void> _fetchRoomPrice() async {
    final roomID = widget.tent.roomID;
    final url = 'https://apibeswp.bellybabe.site/api/dates/GetDatesByDateRange?dateFrom=2024-01-01&dateTo=2024-01-01';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final roomDates = jsonData.where((element) => element['roomID'] == roomID);
      if (roomDates.isNotEmpty) {
        final roomDate = roomDates.first;
        setState(() {
          _roomPrice = roomDate['roomPrice']?.toDouble();
        });
      }
    } else {
      print('Failed to load room price');
    }
  }



  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            // Image container
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(_imageUrls[_selectedImageIndex],
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageUrls.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImageIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius as needed
                            child: Image.asset(_imageUrls[index],
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Description container
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                width: displayWidth,
                child: FittedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              widget.tent.roomName ?? '',
                              // if roomName is null, use an empty string
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 1.10,
                              ),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bookmark,
                                color: Color(0xFF3951EE),
                                size: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 370,
                              child: Text(
                                widget.tent.description ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Duration & Rating container
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                width: displayWidth,
                child: FittedBox(
                  child: Column(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(3.14),
                        child: Container(
                          width: 396,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 10,
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF3951EE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                          size: 32, // Adjust the size as needed
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Loại phòng: ${widget.tent.typeName}' ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Khu vực: ${widget.tent.areaName}' ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Giá: ${_roomPrice ?? ''}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 100,
                                child: Stack(
                                  children: [
                                    // Ratings Container
                                    Container(
                                      width: 60,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF3951EE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 32, // Adjust the size as needed
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: displayWidth,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Stack(children: []),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Climate container
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                width: displayWidth,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Thời tiết',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: displayWidth,
                      height: displayWidth * 0.35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/climate.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Luggage Information container
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                width: displayWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              Text(
                                'Thông tin hành lý',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 1.10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 370,
                              child: Text(
                                'Vui lòng mang theo hành lý xách tay phù hợp để thuận tiện di chuyển trong không gian chung của homestay. Chúng tôi cũng cung cấp không gian để lưu trữ hành lý ký gửi. Để biết thêm chi tiết về quy định và dịch vụ lưu trữ hành lý, vui lòng liên hệ với chúng tôi trước khi đến.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: displayWidth * .3,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

import '../Pages/booking_page.dart';
import '../Pages/bottom_navbar.dart';
import '../models/room.dart';

class ElysiumColony extends StatefulWidget {
  final HotelRoom room;

  ElysiumColony({required this.room});

  @override
  _ElysiumColonyState createState() => _ElysiumColonyState();
}

class _ElysiumColonyState extends State<ElysiumColony> {
  int _selectedImageIndex = 0;
  final List<String> _imageUrls = [
    'assets/images/gallery1.jpg',
    'assets/images/gallery2.jpg',
    'assets/images/gallery3.jpg',
    'assets/images/gallery4.jpg',
    'assets/images/gallery5.jpg',
  ];

  final state = 1;

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
                      child: Image.asset(_imageUrls[_selectedImageIndex]),
                    ),
                  ),
                ),
              ),
              // Image carousel
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
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(_imageUrls[index]),
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
                padding: EdgeInsets.all(displayWidth *.05),
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
                                widget.room.roomName ?? '', // if roomName is null, use an empty string
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
                          child: Text(
                            widget.room.description ?? '', // if roomName is null, use an empty string
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 1.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Duration & Rating container
              Padding(
                padding: EdgeInsets.all(displayWidth *.05),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                          child: Text(
                                            'Duration',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 60,
                                        left: 0,
                                        child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '3 Days',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                height: 1.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                          child: Text(
                                            'Rating',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 60,
                                        left: 0,
                                        child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '4.5',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                height: 1.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                  Icons.share,
                                  color: Color(0xFF3951EE),
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Climate container
              Padding(
                padding: EdgeInsets.all(displayWidth *.05),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                          child: Text(
                                            'Climate',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 60,
                                        left: 0,
                                        child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Tropical',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                height: 1.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                  Icons.share,
                                  color: Color(0xFF3951EE),
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Population chart container
              Padding(
                padding: EdgeInsets.all(displayWidth *.05),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                          child: Text(
                                            'Population',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 60,
                                        left: 0,
                                        child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '1000',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                height: 1.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                  Icons.share,
                                  color: Color(0xFF3951EE),
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Luggage information container
              Padding(
                padding: EdgeInsets.all(displayWidth *.05),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                          child: Text(
                                            'Luggage',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 60,
                                        left: 0,
                                        child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '20kg',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                height: 1.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                  Icons.share,
                                  color: Color(0xFF3951EE),
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                    offset: Offset(0, -1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavBar()),
                      );
                    },
                    child: Text('Đã đặt'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF3951EE),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    },
                    child: Text('Book Your Tour'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF3951EE),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
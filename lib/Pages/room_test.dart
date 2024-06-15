import 'package:flutter/material.dart';
import 'package:test_footer/controller.dart';
import '/pages/booking_page.dart';
import '/pages/bottom_navbar.dart';

class ElysiumColony extends StatefulWidget {
  const ElysiumColony({super.key});

  @override
  State<ElysiumColony> createState() => _ElysiumColonyState();
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
                            child: const Row(
                              children: [
                                Text(
                                  'Phòng Vương Quốc Đỏ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w800,
                                    height: 1.10,
                                  ),
                                ),
                              ],
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
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 370,
                              child: Text(
                                'Vương Quốc Đỏ – tên gọi đầy tự hào của vùng quê Mang Thít – nơi hàng nghìn lò nung gạch gốm khổng lồ mọc san sát nhau như những tòa lâu đài của một miền vương quốc. Lấy cảm hứng từ đây, phòng Vương Quốc Đỏ được thiết kế với diện tích lớn bao gồm cả phòng khách và phòng ngủ, bày trí theo tinh thần tái hiện lại một không gian nặng tình miền Tây. Mang hơi thở Indochina đậm nét, các đồ trang trí trong phòng được tô điểm từ gạch gốm – một dấu ấn đặc trưng nơi quê mẹ Mang Thít – Vĩnh Long. Bên cạnh đó, để tạo ra một trải nghiệm nghỉ dưỡng hoàn hảo, phòng Vương Quốc Đỏ đặt để những chấm phá đậm nét thiên nhiên bằng các bức tranh ghi lại vẻ đẹp của cảnh sắc quê nhà.',
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
                                width: 100,
                                height: 60,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
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
                              const SizedBox(width: 16),
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2 Giường ngủ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '1 Phòng khách',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Ban công',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.10,
                                    ),
                                  ),
                                  Text(
                                    'View hồ trung tâm',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
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
                                height: 60,
                                child: Stack(
                                  children: [
                                    // Ratings Container
                                    Container(
                                      width: 60,
                                      height: 60,
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
                                children: [
                                ],
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

            // Population chart container
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                width: displayWidth,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Mức phổ biến',
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
                          image: AssetImage("assets/images/population.png"),
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
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 120,
            padding: EdgeInsets.all(displayWidth * .05),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(239, 0, 32, 50),
                  Color.fromARGB(230, 150, 168, 255),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cancer Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(displayWidth * .44, displayWidth * .16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 0, 73, 255)),
                    ),
                  ),
                  child: const Text(
                    'Đã đặt',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 73, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),

                // Book Your Tour Button (Gradient Button)
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Booking()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 73, 255),
                          Color.fromARGB(255, 162, 221, 255),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    width: displayWidth * 0.44,
                    height: displayWidth * 0.16,
                    padding: EdgeInsets.symmetric(
                      horizontal: displayWidth * 0.1,
                      vertical: displayWidth * 0.01,
                    ),

                    child: Center(
                        child: getStateWidget(state),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}


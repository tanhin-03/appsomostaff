import 'package:flutter/material.dart';
import '/pages/room_test.dart';
import '/pages/my_account.dart';
import 'bottom_navbar.dart';
import 'notifications_page.dart';

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

  var currentIndex = 0;

  // DateTime? selectedDate;

  // Future<void> _selectDate(BuildContext context) async {
    // final DateTime? pickedDate = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2003),
    //   lastDate: DateTime(2160),
    // );
    // if (pickedDate != null) {
    //   setState(() {
    //     selectedDate = pickedDate;
    //   });
    // }
  // }

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
                      "Find Room",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 12),

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
                            controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                            decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "Select a space station",
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ElysiumColony()));
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
                              'Search',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                          'Room List',
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          LocationButton(
                            imageAsset: 'assets/images/gallery1.jpg',
                            title: 'Phòng Vương Quốc Đỏ\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                          LocationButton(
                            imageAsset: 'assets/images/gallery2.jpg',
                            title: 'Phòng Dấu ấn Mang Thít\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                          LocationButton(
                            imageAsset: 'assets/images/gallery3.jpg',
                            title: 'Phòng Cửu Long\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                        ],
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
                          'Tent List',
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          LocationButton(
                            imageAsset: 'assets/images/tent1.jpg',
                            title: 'Lều trại dã ngoại Glamping T1\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                          LocationButton(
                            imageAsset: 'assets/images/tent2.jpg',
                            title: 'Lều trại dã ngoại Glamping T2\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                          LocationButton(
                            imageAsset: 'assets/images/tent3.jpg',
                            title: 'Lều trại dã ngoại Glamping T3\n',
                            description: 'Destination',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ElysiumColony()));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: displayWidth * .025),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavBar(),
    );
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

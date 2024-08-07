import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_footer/Pages/booking_detail.dart';
import '/pages/my_account.dart';
import 'celander.dart';
import 'home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({sup, required});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(199, 255, 255, 255),
            Color.fromARGB(197, 191, 203, 255),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: _pageController,
          children: screens,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(displayWidth * .04),
          height: displayWidth * .145,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child:
          ListView.builder(
            itemCount: 4, // updated to 4 items
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth *.06),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeInOut);
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth *.23 // updated width calculation
                        : displayWidth *.14, // updated width calculation
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex? displayWidth *.10 : 0, // updated height calculation
                      width: index == currentIndex? displayWidth *.24 : 0, // updated width calculation
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth *.23 // updated width calculation
                        : displayWidth *.20, // updated width calculation
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth *.10 // updated width calculation
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth *.02 // updated width calculation
                                  : 20,
                            ),
                            _bottomNavBarIcons[index],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  final List<Image> _bottomNavBarIcons = [
    Image.asset('assets/icons/home.png', width: 32, height: 24),
    Image.asset('assets/icons/booking.png', width: 32, height: 24),
    Image.asset('assets/icons/saves.png', width: 32, height: 24),
    Image.asset('assets/icons/profile.png', width: 32, height: 24),
  ];

  List<String> listOfStrings = [
    'Home',
    'Calender',
    'Booking',
    'Account',
  ];

  List<Widget> screens = [
    const HomePage(),
    // const HomePage2(),
    const BookingPage(),
    const CelanderPage(),
    const MyAccountPage(),
  ];

  final PageController _pageController = PageController();
}

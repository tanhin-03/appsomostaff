import 'package:flutter/material.dart';

import '../test/signin_page.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'signin_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double accountButtonHeight = 75.0;
    double spaceBetweenButtons = 16.0;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAccountPage()));
                      },
                      child: Container(
                        height: accountButtonHeight,
                        width: displayWidth * 0.7,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 1, 73, 255),
                              Color.fromARGB(255, 162, 221, 255)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 10),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                            ),
                            SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    'User Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    'User ID: 123456',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(width: spaceBetweenButtons),
                    // Material(
                    //   elevation: 2.0,
                    //   borderRadius: BorderRadius.circular(20.0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
                    //     },
                    //     child: Container(
                    //       width: accountButtonHeight,
                    //       height: accountButtonHeight,
                    //       decoration: BoxDecoration(
                    //         color: const Color.fromARGB(255, 255, 255, 255),
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //       child: const Center(
                    //         child: ImageIcon(
                    //           AssetImage('assets/images/bell.png'),
                    //           color: Colors.blue,
                    //           size: 32,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GradientButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
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
                      'Log out',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// demo -------------------------------------------------------------------------------------

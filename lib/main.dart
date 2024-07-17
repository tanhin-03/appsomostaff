import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test_footer/Pages/bottom_navbar.dart';
import 'package:test_footer/Pages/signin_page.dart';
import 'package:test_footer/firebase_api.dart';
import 'package:test_footer/Pages/booking_detail.dart';
import 'Pages/home_page.dart';
// import 'Pages/signin_page.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();

  FirebaseApi firebaseApi = FirebaseApi();
  firebaseApi.initNotifications();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Somo Staff',
      // home: SignInPage(),
      // home: HomePage(),
      // home: CelanderPage(),
      home: NavBar(),
    );
  }
}

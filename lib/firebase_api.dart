import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;


  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    
    print('Token: $fCMToken');

    FirebaseMessaging.onBackgroundMessage(handlerMessager);

    FirebaseMessaging.onMessage;

    FirebaseMessaging.onMessageOpenedApp;

    FirebaseMessaging.instance;
  }
}


Future<void> handlerMessager(RemoteMessage message) async {
  print('Title:  ${message.notification?.title}');
  print('Body:  ${message.notification?.body}');
  print('Payload: ${message.data}');
}





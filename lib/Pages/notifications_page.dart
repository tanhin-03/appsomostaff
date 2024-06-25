import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  List<RemoteMessage> _notifications = [];
  late StreamSubscription _messageSubscription;
  late StreamSubscription _messageOpenedAppSubscription;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });

    _messageSubscription = FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (mounted) {
        setState(() {
          _notifications.add(message);
        });
      }
    });

    _messageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (mounted) {
        setState(() {
          _notifications.add(message);
        });
      }
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    _messageOpenedAppSubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: _notifications.isEmpty
          ? Center(child: Text('No notifications'))
          :
      ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          print('Notification data: ${_notifications[index].data}');
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: _notifications[index].data['title']!= null
                  ? Text(_notifications[index].data['title'])
                  : Text('Somo Staff'),
              subtitle: _notifications[index].data['body']!= null
                  ? Text(_notifications[index].data['body'])
                  : Text('Somo Staff'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Delete the notification here
                  _deleteNotification(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/tent.dart';
import '/models/room.dart';
import 'package:http/http.dart' as http;
import 'api_urls.dart';

class ApiRoom {
  Future<List<HotelRoom>> fetchRoom() {
    return http.get(ApiUrls().API_DATA_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List<dynamic> hotelRoom = useListContainer;
      return hotelRoom
          .map((contactRaw) => new HotelRoom.fromJson(contactRaw))
          .toList();
    });
  }
}

class ApiTent {
  Future<List<HomestayTent>> fetchTent() {
    return http.get(ApiUrls().API_DATA_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List<dynamic> hotelTent = useListContainer;
      return hotelTent
          .map((contactRaw) => new HomestayTent.fromJson(contactRaw))
          .toList();
    });
  }
}


class FirebaseApi with ChangeNotifier {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _notificationStream = StreamController<RemoteMessage>();

  Stream<RemoteMessage> get notificationStream => _notificationStream.stream;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');

    FirebaseMessaging.onMessage;

    FirebaseMessaging.onMessageOpenedApp;

  }

}


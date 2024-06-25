import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_footer/Pages/notifications_page.dart';
import 'package:test_footer/models/customer.dart';

import '../models/account.dart';
import '../models/tent.dart';
import '/models/room.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
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
      final List hotelRoom = useListContainer['rooms'];
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
      final List hotelTent = useListContainer['rooms'];
      return hotelTent
          .map((contactRaw) => new HomestayTent.fromJson(contactRaw))
          .toList();
    });
  }
}

// class ApiAccount {
//   Future<Account> fetchAccount(String username, String password) {
//     return http
//         .get(ApiUrls().API_DATA_LIST)
//         .then((http.Response response) {
//       final String jsonBody = response.body;
//       final int statusCode = response.statusCode;
//
//       if (statusCode!= 200 || jsonBody == null) {
//         print(response.reasonPhrase);
//         throw new Exception("Lỗi load api");
//       }
//
//       final JsonDecoder _decoder = new JsonDecoder();
//       final useMapContainer = _decoder.convert(jsonBody);
//       return Account.fromJson(useMapContainer);
//     });
//   }
// }

class ApiCustomer {
  Future<List<CustomerList>> fetchCus() {
    return http.get(ApiUrls().API_CUSTOMER_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List customerList = useListContainer['customers'];
      return customerList
          .map((contactRaw) => CustomerList.fromJson(contactRaw))
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


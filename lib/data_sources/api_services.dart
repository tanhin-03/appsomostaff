
import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/account.dart';
import '../models/tent.dart';
import '/models/room.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'api_urls.dart';


class ApiRoom{
  Future<List<HotelRoom>> fetchRoom() {
    return http
        .get(ApiUrls().API_DATA_LIST)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if(statusCode != 200 || jsonBody == null){
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List hotelRoom = useListContainer['rooms'];
      return hotelRoom.map((contactRaw) => new HotelRoom.fromJson(contactRaw)).toList();
    });
  }
}


class ApiTent{
  Future<List<HomestayTent>> fetchTent() {
    return http
        .get(ApiUrls().API_DATA_LIST)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if(statusCode != 200 || jsonBody == null){
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List hotelTent = useListContainer['rooms'];
      return hotelTent.map((contactRaw) => new HomestayTent.fromJson(contactRaw)).toList();
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


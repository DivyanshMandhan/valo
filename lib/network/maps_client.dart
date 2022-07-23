// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:valo/network/api_client.dart';

import '../models/map.dart';

class MapsClient extends ApiClient {
  // Get Maps
  Future<Iterable<Maps>> getlAllMaps() async {
    Iterable<Maps> maps = [];
    try {
      // Get response
      Response response = await super.dio.get("${super.baseUrl}v1/maps");

      // Parsed list bunu mapleyip her haritayi tek tek maps listesine atiyoruz
      List parsedList = response.data['data'];
      maps = parsedList.map((element) {
        return Maps.fromJson(element);
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return maps;
  }
}

// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:valo/models/rank.dart';
import 'package:valo/network/api_client.dart';

class RankClient extends ApiClient {
  // Get Ranks
  Future<Iterable<Rank>> getAllRanks() async {
    Iterable<Rank> ranks = [];
    try {
      // Get response
      Response response =
          await super.dio.get("${super.baseUrl}v1/competitivetiers");

      // Parsed list bunu mapleyip her ranki tek tek ranks listesine atiyoruz
      List parsedList = response.data['data'];
      ranks = parsedList.map((element) {
        return Rank.fromJson(element);
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
    return ranks;
  }
}

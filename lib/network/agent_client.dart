// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:valo/network/api_client.dart';

import '../models/agent.dart';

class AgentClient extends ApiClient {
  // Get Agents
  Future<Iterable<Agent>> getAgents({String? agentRole}) async {
    Iterable<Agent> agents = [];
    try {
      // Get response
      Response response = await super.dio.get("${super.baseUrl}v1/agents",
          queryParameters: {'isPlayableCharacter': true});

      // Parsed list bunu mapleyip her ajani tek tek agents listesine atiyoruz
      List parsedList = response.data['data'];
      agents = parsedList.map((element) {
        return Agent.fromJson(element);
      });

      if (agentRole != null) {
        agents = agents.where((element) =>
            element.role!.displayName!.toLowerCase() ==
            agentRole.toLowerCase());
      }
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
    return agents;
  }
}

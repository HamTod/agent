import 'dart:convert';

import 'package:agent/models/agent_list.dart';
import 'package:agent/models/api_result.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const BASE_URL = 'https://valorant-api.com';


  Future<dynamic> fetch(
    String endPoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    String queryString = Uri(queryParameters: queryParams).query;
    var url = Uri.parse('$BASE_URL/$endPoint?$queryString');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // แปลง text ที่มีรูปแบบเป็น JSON ไปเป็น Dart's data structure (List/Map)
      Map<String, dynamic> jsonBody = json.decode(response.body);

      print('RESPONSE BODY: $jsonBody');

      // แปลง Dart's data structure ไปเป็น model (POJO)
      var apiResult = ApiResult.fromJson(jsonBody);

      if (apiResult.status == 200) {
        return apiResult.data;
      }
    } else {
      throw 'Server connection failed!';
    }
  }
}

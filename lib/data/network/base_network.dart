import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../application/uri_constant.dart';

class BaseNetwork {
  String baseUrl = MasterUri.baseUrl.prodUrl;

  Future<List<dynamic>?> getList(String pathUrl) async {
    try {
      final fullUrl = "$baseUrl/$pathUrl";
      debugPrint("BaseNetwork is Running - fullUrl : $fullUrl");

      final response = await http.Client().get(Uri.parse(fullUrl));
      // debugPrint("BaseNetwork Response : ${response.body}");

      return _processListResponse(response);
    } finally {
      http.Client().close();
    }
  }

  Future<List<dynamic>?> _processListResponse(http.Response response) async {
    final body = response.body;

    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      debugPrint('data : $jsonBody');
      return jsonBody;
    } else {
      debugPrint("Process Response is error");
      return [];
    }
  }
}

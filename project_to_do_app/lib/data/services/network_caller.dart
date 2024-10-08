import 'dart:convert';

import 'package:http/http.dart';
import 'package:project_to_do_app/data/models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    Uri uri = Uri.parse(url);
    try {
      final Response response = await get(uri);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeData);
      } else {}
    } catch (e) {}
  }
}

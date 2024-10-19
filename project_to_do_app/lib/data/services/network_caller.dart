import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:project_to_do_app/data/models/network_response.dart';
import 'package:project_to_do_app/ui/controllers/auth_controller.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({ required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      final Response response = await get(uri);

      printResponse(url, response);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        if(decodeData['status'] == 'fail'){
          return NetworkResponse(
              isSuccess: false,
              statusCode: response.statusCode,
              errorMessage: decodeData['data'],
          );
        }
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeData);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': AuthController.accessToken.toString(),
      };
      debugPrint(url);
      final Response response = await post(
          uri,
          headers: headers,
          body: jsonEncode(body)
      );
      printRequest(url, body, headers);
      printResponse(url, response);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeData);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void printRequest(String url, Map<String, dynamic>? body, Map<String, dynamic>? headers) {
    debugPrint(
        'Request\nURL: $url\nBODY: $body\nHEADERS: $headers'
    );
  }

  static void printResponse(String url,Response response) {
    debugPrint('URL: $url\nRESPONSE CODE: ${response.statusCode}\nBODY: ${response.body}');
  }
}

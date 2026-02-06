import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_response.dart';

class NetworkClient {
  Logger logger = Logger();
  final Map<String, String> commonHeaders;
  final VoidCallback onUnAuthorize;

  NetworkClient({required this.onUnAuthorize, required this.commonHeaders});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await get(uri, headers: commonHeaders);
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          responseData: responseBody,
          isSuccess: true,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Un-Authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders, body: body);
      final Response response = await post(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          responseData: responseBody,
          isSuccess: true,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Un-Authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    String message =
        '''
URL ->$url
HEADER -> $headers
BODY -> $body
''';

    logger.i(message);
  }

  void _logResponse(Response response) {
    String message =
        '''
URL -> ${response.request?.url}
STATUSCODE -> ${response.statusCode}
HEADER-> ${response.request?.headers}
BODY-> ${response.body}
''';

    logger.i(message);
  }
}

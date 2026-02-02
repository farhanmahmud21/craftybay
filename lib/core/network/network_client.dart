import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';
part 'network_response.dart';

class NetworkClient {
  final Logger _logger = Logger();
  final VoidCallback onAuthorize;
  final Map<String, String> commonHeaders;
  NetworkClient({required this.onAuthorize, required this.commonHeaders});
  //Get Request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await get(uri, headers: commonHeaders);
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
          errorMessage: responseBody['message'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> postRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await post(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
          errorMessage: responseBody['message'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> putRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await put(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
          errorMessage: responseBody['message'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> patchRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await patch(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
          errorMessage: responseBody['message'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> deleteRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await delete(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: responseBody,
          errorMessage: responseBody['message'] ?? 'Something went wrong',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, errorMessage: e.toString());
    }
  }

  void _logRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? body,
  }) {
    final message =
        ''' 
    URL ->$url
    Headers -> $headers
    body ->$body
    
    ''';

    _logger.i(message);
  }

  void _logResponse(Response response) {
    final String message =
        ''' 
URL -> ${response.request?.url}
HEADERS -> ${response.request?.headers}
BODY -> ${response.body}
    ''';
    _logger.i(message);
  }
}

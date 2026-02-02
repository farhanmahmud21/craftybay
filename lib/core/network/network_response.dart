part of 'network_client.dart';

class NetworkResponse {
  final int statusCode;
  final String? errorMessage;
  final Map<String, dynamic>? responseData;

  NetworkResponse({
    required this.statusCode,
    this.errorMessage,
    this.responseData,
  });
}

import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl;
  Dio _dio;
  ApiServices(Dio dio, {required String baseUrl})
      : _baseUrl = baseUrl,
        _dio = dio;
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$_baseUrl$endpoint");
    return response.data;
  }
}

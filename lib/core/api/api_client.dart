import 'package:apk/core/api/api_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late Dio dio;

  factory ApiClient() => _instance;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        headers: {'Content-Type': 'application/json', 'x-platform': 'APK'},
      ),
    );
    dio.interceptors.add(ApiInterceptor());
  }
}

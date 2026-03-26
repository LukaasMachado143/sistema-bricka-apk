import 'package:apk/features/auth/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:apk/core/api/api_client.dart';

class AuthService {
  final Dio _dio = ApiClient().dio;

  Future<String> getToken(String username, String password) async {
    final response = await _dio.post(
      '/auth',
      data: {'username': username, 'password': password},
    );
    String token = response.data ?? '';
    return token;
  }

  Future<UserModel?> getInitialUserData() async {
    final response = await _dio.get('/auth/initial-infos');
    UserModel user = UserModel.fromJson(response.data ?? '');
    return user;
  }
}

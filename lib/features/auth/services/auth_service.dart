import 'package:dio/dio.dart';
import '../../../core/api_client.dart';

class AuthService {
  final ApiClient api;

  AuthService(this.api);

  Future<Response> register(String username, String password) {
    return api.dio.post('/register', data: {
      'username': username,
      'password': password,
    });
  }

  Future<String?> login(String username, String password) async {
    final res = await api.dio.post('/login', data: {
      'username': username,
      'password': password,
    });
    return res.data['token'] as String?;
  }

  Future<Response> profile(String token) {
    return api.dio.get('/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}

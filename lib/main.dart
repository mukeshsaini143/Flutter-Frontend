import 'package:flutter/material.dart';
import 'core/api_client.dart';
import 'features/auth/services/auth_service.dart';
import 'features/auth/screens/login_screen.dart';

void main() {
  // API_BASE_URL is passed via --dart-define
  const apiBaseUrl = String.fromEnvironment('API_BASE_URL',
      defaultValue: '/api');

  final apiClient = ApiClient(apiBaseUrl);
  final authService = AuthService(apiClient);

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  const MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login 🚀 (Pipeline Test)',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(authService: authService),
    );
  }
}

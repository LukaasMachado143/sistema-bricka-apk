import 'package:apk/services/auth_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    _checkLogin();
  }

  _checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    final isLogged = AuthService.isLogged();
    Navigator.pushReplacementNamed(context, isLogged ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

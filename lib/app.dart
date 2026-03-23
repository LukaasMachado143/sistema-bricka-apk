import 'package:apk/core/theme/app_theme.dart';
import 'package:apk/screens/home_screen.dart';
import 'package:apk/features/auth/presentation/pages/login_page.dart';
import 'package:apk/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bricka',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}

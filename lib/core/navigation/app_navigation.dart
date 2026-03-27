import 'package:flutter/material.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void goToLogin() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }

  static void goToHome() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/home',
          (route) => false,
    );
  }
}

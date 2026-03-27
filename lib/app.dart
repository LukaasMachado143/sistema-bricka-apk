import 'package:apk/core/layout/main_layout.dart';
import 'package:apk/core/navigation/app_navigation.dart';
import 'package:apk/core/theme/app_theme.dart';
import 'package:apk/core/widgets/brk_snackbar.dart';
import 'package:apk/features/auth/loading_user_data/pages/loading_user_data.dart';
import 'package:apk/features/auth/login/pages/login_page.dart';
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
        '/': (_) => const LoadingUserData(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const MainLayout()
      },
      scaffoldMessengerKey: BrkSnackbar.messengerKey,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}

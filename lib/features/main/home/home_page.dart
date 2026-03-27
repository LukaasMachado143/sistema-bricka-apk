import 'package:apk/core/storage/local_storage.dart';
import 'package:apk/core/theme/app_colors.dart';
import 'package:apk/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user = UserModel();

  @override
  void initState() {
    _setUser();
    super.initState();
  }

  void _setUser() async {
    user = await LocalStorage.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text('Estou na home')),
    );
  }
}

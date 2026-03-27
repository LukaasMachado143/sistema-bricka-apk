import 'package:apk/core/layout/main_app_bar.dart';
import 'package:apk/core/layout/main_bottom_app_bar.dart';
import 'package:apk/core/storage/local_storage.dart';
import 'package:apk/features/auth/models/user_model.dart';
import 'package:apk/features/main/budget/budget_page.dart';
import 'package:apk/features/main/home/home_page.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  UserModel? user = UserModel();
  String surname = "";
  String image = "";
  int currentIndex = 0;
  final pages = [HomePage(), BudgetPage()];

  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  _loadUser() async {
    final response = await LocalStorage.getUser();
    if (!mounted) return;
    if (user != null) {
      setState(() {
        user = response;
        surname = user?.surname ?? "-";
        image = user?.image ?? "";
      });
    }
  }

  void _handleCurrentIndex(int index) {
    setState(() => currentIndex = index);
  }

  _handleLogout() {
    LocalStorage.clearToken();
    LocalStorage.clearUser();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(user: user, onLogout: _handleLogout),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: MainBottomAppBar(currentIndex: currentIndex, onTap: _handleCurrentIndex),
    );
  }
}

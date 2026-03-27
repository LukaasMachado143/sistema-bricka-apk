import 'package:apk/core/storage/local_storage.dart';
import 'package:apk/core/theme/app_colors.dart';
import 'package:apk/features/auth/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomAppBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const MainBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<MainBottomAppBar> createState() => _MainBottomAppBarState();
}

class _MainBottomAppBarState extends State<MainBottomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      selectedItemColor: AppColors.secondary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.price_change_outlined),
          label: 'Orçamentos',
        ),
      ],
    );
  }
}

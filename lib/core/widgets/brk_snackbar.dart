import 'package:apk/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum SnackbarType { success, error, info, warning }

class BrkSnackbar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static Color _getColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppColors.success;
      case SnackbarType.error:
        return AppColors.error;
      case SnackbarType.warning:
        return AppColors.warning;
      case SnackbarType.info:
      default:
        return AppColors.info;
    }
  }

  static void show({
    required String text,
    SnackbarType type = SnackbarType.info,
    int duration = 3,
  }) {
    final messenger = messengerKey.currentState;

    if (messenger == null) return;

    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: _getColor(type),
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // 🔥 atalhos (igual Vue)
  static void success(String text, {int duration = 3}) {
    show(text: text, type: SnackbarType.success, duration: duration);
  }

  static void error(String text, {int duration = 3}) {
    show(text: text, type: SnackbarType.error, duration: duration);
  }

  static void info(String text, {int duration = 3}) {
    show(text: text, type: SnackbarType.info, duration: duration);
  }

  static void warning(String text, {int duration = 3}) {
    show(text: text, type: SnackbarType.warning, duration: duration);
  }
}

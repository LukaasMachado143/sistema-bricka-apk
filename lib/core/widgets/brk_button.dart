import 'package:apk/core/widgets/brk_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum Size { normal, small, xSmall }

class BrkButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final Size size;

  const BrkButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.color,
    this.size = Size.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading
            ? BrkCircularProgressIndicator(color: AppColors.text50)
            : Text(title, style: _getTextStyle()),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case Size.small:
        return 40;
      case Size.xSmall:
        return 32;
      default:
        return 48;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Size.small:
        return AppTextStyles.buttonSmall;
      case Size.xSmall:
        return AppTextStyles.buttonXSmall;
      default:
        return AppTextStyles.button;
    }
  }
}

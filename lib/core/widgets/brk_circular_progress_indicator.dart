import 'package:apk/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BrkCircularProgressIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;

  const BrkCircularProgressIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2,
        color: color ?? AppColors.secondary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        titleLarge: AppTextStyles.h4,
        titleMedium: AppTextStyles.subtitle,
        bodyLarge: AppTextStyles.bodyHighlight,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.legend,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.inputLabel,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

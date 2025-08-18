import 'package:flutter/material.dart';
import '../design/ui_constants.dart';
import '../design/colors.dart';
import '../design/text_styles.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineSmall: AppTextStyles.headline,   // replaces headline6
      bodyMedium: AppTextStyles.body,          // replaces bodyText2
      titleMedium: AppTextStyles.subtitle,     // replaces subtitle1
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(UIConstants.borderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UIConstants.borderRadius),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UIConstants.borderRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.all(16),
      labelStyle: const TextStyle(color: AppColors.grey),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: UIConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIConstants.borderRadius),
      ),
    ),
  );
}

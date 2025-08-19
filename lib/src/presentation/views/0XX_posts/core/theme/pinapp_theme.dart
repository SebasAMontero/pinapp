import 'package:flutter/material.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';

class PinappTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstants.background,
      primaryColor: ColorConstants.primary,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: ColorConstants.primary,
        onPrimary: Colors.white,
        secondary: ColorConstants.accent,
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: ColorConstants.textPrimary,
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstants.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorConstants.accent,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: ColorConstants.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: ColorConstants.textSecondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

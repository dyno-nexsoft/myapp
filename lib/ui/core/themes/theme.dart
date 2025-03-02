import 'package:flutter/material.dart';

import '../../../config/colors.gen.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: Color.fromRGBO(0, 0, 0, 0.5),
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.red,
      onError: AppColors.black,
    ),
    dividerTheme: const DividerThemeData(color: AppColors.grey97),
    shadowColor: AppColors.black,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: AppColors.black,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: Color.fromRGBO(255, 255, 255, 0.9),
      onSecondary: AppColors.black,
      surface: AppColors.black,
      onSurface: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
    ),
    dividerTheme: const DividerThemeData(color: AppColors.greyEE),
    shadowColor: AppColors.white,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}

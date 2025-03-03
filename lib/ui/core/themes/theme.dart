import 'package:flutter/material.dart';

import '../../../config/colors.gen.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.red,
      onError: AppColors.black,
    ),
    dividerTheme: const DividerThemeData(color: AppColors.grey),
    shadowColor: AppColors.black,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: AppColors.black,
    ),
    cardTheme: CardTheme(
      color: AppColors.grey.shade50,
      shadowColor: AppColors.black,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final darkTheme = ThemeData(
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
    dividerTheme: DividerThemeData(color: AppColors.grey.shade400),
    shadowColor: AppColors.white,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
    ),
    cardTheme: CardTheme(
      color: AppColors.black,
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.grey.shade400,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}

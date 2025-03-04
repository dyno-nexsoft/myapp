import 'package:flutter/material.dart';

import '../../../config/colors.gen.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.all(16),
    prefixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
    suffixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static const _buttonStyle = ButtonStyle(
    enableFeedback: true,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    minimumSize: WidgetStatePropertyAll(Size(112, 56)),
  );

  static const _bottomAppBarTheme = BottomAppBarTheme(
    height: 56 + 16 * 2, // Button height
    padding: EdgeInsets.all(16),
    shape: CircularNotchedRectangle(),
  );

  static const _progressIndicatorThemeData = ProgressIndicatorThemeData(
    strokeCap: StrokeCap.round,
    strokeWidth: 8,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: Color.fromRGBO(0, 0, 0, 0.5),
      onSecondary: AppColors.onPrimary,
      surface: AppColors.onPrimary,
      onSurface: AppColors.primary,
      error: AppColors.error,
      onError: AppColors.primary,
    ),
    dividerTheme: DividerThemeData(color: AppColors.grey.shade200),
    shadowColor: AppColors.primary,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.error,
      textColor: AppColors.primary,
    ),
    cardTheme: CardTheme(
      color: AppColors.grey.shade50,
      shadowColor: AppColors.primary,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppColors.grey.shade50,
      hintStyle: const TextStyle(color: AppColors.grey),
    ),
    filledButtonTheme: const FilledButtonThemeData(style: _buttonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buttonStyle.copyWith(
        side: WidgetStateProperty.all(const BorderSide(color: AppColors.grey)),
      ),
    ),
    bottomAppBarTheme: _bottomAppBarTheme.copyWith(
      shadowColor: AppColors.primary,
    ),
    progressIndicatorTheme: _progressIndicatorThemeData,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.onPrimary,
      onPrimary: AppColors.primary,
      secondary: Color.fromRGBO(255, 255, 255, 0.9),
      onSecondary: AppColors.primary,
      surface: AppColors.primary,
      onSurface: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.onPrimary,
    ),
    dividerTheme: DividerThemeData(color: AppColors.grey.shade400),
    shadowColor: AppColors.onPrimary,
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.error,
      textColor: AppColors.onPrimary,
    ),
    cardTheme: CardTheme(
      color: AppColors.primary,
      surfaceTintColor: AppColors.onPrimary,
      shadowColor: AppColors.grey.shade400,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: const FilledButtonThemeData(style: _buttonStyle),
    outlinedButtonTheme: const OutlinedButtonThemeData(style: _buttonStyle),
    bottomAppBarTheme: _bottomAppBarTheme,
  );
}

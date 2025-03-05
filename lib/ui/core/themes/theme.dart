import 'package:flutter/material.dart';

import '../../../config/colors.gen.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsetsDirectional.all(16),
    prefixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
    suffixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
    hintStyle: TextStyle(color: AppColors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static const _buttonStyle = ButtonStyle(
    enableFeedback: true,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: WidgetStatePropertyAll(
      EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
    ),
    minimumSize: WidgetStatePropertyAll(Size(112, 56)),
  );

  static const _bottomAppBarTheme = BottomAppBarTheme(
    height: 56 + 16 * 2, // Button height
    padding: EdgeInsetsDirectional.all(16),
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
    shadowColor: Colors.black,
    badgeTheme: const BadgeThemeData(backgroundColor: Colors.red),
    cardTheme: CardTheme(
      color: AppColors.grey.shade50,
      shadowColor: Colors.black,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppColors.grey.shade50,
      counterStyle: const TextStyle(color: AppColors.grey),
      focusedBorder: _inputDecorationTheme.focusedBorder?.copyWith(
        // ignore: avoid_redundant_argument_values
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: _buttonStyle),
    filledButtonTheme: const FilledButtonThemeData(style: _buttonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buttonStyle.copyWith(
        side: WidgetStateProperty.all(const BorderSide(color: AppColors.grey)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: _buttonStyle.copyWith(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: _buttonStyle.copyWith(
        padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.all(16)),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
    ),
    bottomAppBarTheme: _bottomAppBarTheme.copyWith(
      elevation: 0.5,
      shadowColor: Colors.black,
    ),
    progressIndicatorTheme: _progressIndicatorThemeData,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.onPrimary,
      onPrimary: AppColors.primary,
      secondary: Color.fromRGBO(255, 255, 255, 0.8),
      onSecondary: AppColors.primary,
      surface: AppColors.primary,
      onSurface: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.onPrimary,
    ),
    dividerTheme: DividerThemeData(color: AppColors.grey.shade400),
    shadowColor: Colors.white,
    badgeTheme: const BadgeThemeData(backgroundColor: Colors.red),
    cardTheme: const CardTheme(
      color: AppColors.primary,
      surfaceTintColor: AppColors.onPrimary,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppColors.grey.shade900,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: _buttonStyle),
    filledButtonTheme: const FilledButtonThemeData(style: _buttonStyle),
    outlinedButtonTheme: const OutlinedButtonThemeData(style: _buttonStyle),
    textButtonTheme: TextButtonThemeData(
      style: _buttonStyle.copyWith(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: _buttonStyle.copyWith(
        padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.all(16)),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
    ),
    bottomAppBarTheme: _bottomAppBarTheme,
  );
}

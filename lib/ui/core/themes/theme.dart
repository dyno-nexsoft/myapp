import 'package:flutter/material.dart';

import '../../../config/colors.gen.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsetsDirectional.all(16),
    prefixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
    suffixIconConstraints: BoxConstraints(maxHeight: 24, minWidth: 48),
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
    height: 56 + 16 * 2, // Button height + padding
    padding: EdgeInsetsDirectional.all(16),
    shape: CircularNotchedRectangle(),
  );

  static const _navigationBarThemeData = NavigationBarThemeData(
    height: 56 + 8 * 2, // Button height + padding
  );

  static const _progressIndicatorThemeData = ProgressIndicatorThemeData(
    strokeCap: StrokeCap.round,
    strokeWidth: 8,
  );

  static const _tabBarThemeData = TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    splashBorderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const _cardThemeData = CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    margin: EdgeInsetsDirectional.zero,
    clipBehavior: Clip.hardEdge,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.primary.withAlpha((255 * 0.5).round()),
      onSecondary: AppColors.onPrimary,
      surface: Colors.white,
      onSurface: Colors.black,
      error: AppColors.error,
      onError: AppColors.primary,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppColors.grey.shade50,
      counterStyle: const TextStyle(color: AppColors.grey),
      hintStyle: const TextStyle(color: AppColors.grey),
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
    navigationBarTheme: _navigationBarThemeData.copyWith(
      elevation: 0.5,
      shadowColor: Colors.black,
    ),
    progressIndicatorTheme: _progressIndicatorThemeData.copyWith(
      circularTrackColor: Colors.white,
    ),
    tabBarTheme: _tabBarThemeData.copyWith(
      labelColor: AppColors.onPrimary,
      indicator: BoxDecoration(
        color: AppColors.primary,
        borderRadius: _tabBarThemeData.splashBorderRadius,
      ),
    ),
    cardTheme: _cardThemeData.copyWith(
      elevation: 0,
      color: Colors.white,
      surfaceTintColor: Colors.black,
      shadowColor: Colors.black,
      shape: (_cardThemeData.shape as RoundedRectangleBorder).copyWith(
        side: BorderSide(color: AppColors.grey.shade200),
      ),
    ),
    dividerTheme: DividerThemeData(color: AppColors.grey.shade200),
    shadowColor: Colors.black,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.onPrimary,
      onPrimary: AppColors.primary,
      secondary: AppColors.onPrimary.withAlpha((255 * 0.8).round()),
      onSecondary: AppColors.primary,
      surface: Colors.black,
      onSurface: Colors.white,
      error: AppColors.error,
      onError: AppColors.onPrimary,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme.copyWith(
      focusedBorder: _inputDecorationTheme.focusedBorder?.copyWith(
        borderSide: const BorderSide(color: AppColors.onPrimary),
      ),
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
    navigationBarTheme: _navigationBarThemeData,
    progressIndicatorTheme: _progressIndicatorThemeData,
    tabBarTheme: _tabBarThemeData.copyWith(
      labelColor: AppColors.primary,
      indicator: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: _tabBarThemeData.splashBorderRadius,
      ),
    ),
    cardTheme: _cardThemeData.copyWith(
      color: Colors.black,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
    ),
    shadowColor: Colors.white,
  );
}

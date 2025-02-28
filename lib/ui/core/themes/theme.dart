import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme();

  static const _inputDecorationTheme = InputDecorationTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black12,
      onSecondary: Colors.white12,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.white,
      onError: Colors.red,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.white12,
      onSecondary: Colors.black12,
      surface: Colors.black,
      onSurface: Colors.white,
      error: Colors.black,
      onError: Colors.red,
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}

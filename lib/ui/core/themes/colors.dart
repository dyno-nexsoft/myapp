import 'package:flutter/material.dart';

abstract final class AppColors {
  static const grey1 = Color(0xFFF2F2F2);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black12,
    onSecondary: Colors.white12,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.white,
    onError: Colors.red,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white12,
    onSecondary: Colors.black12,
    surface: Colors.black,
    onSurface: Colors.white,
    error: Colors.black,
    onError: Colors.red,
  );
}

import 'package:flutter/material.dart';

import '../../../utils/command.dart';
import '../../../utils/result.dart';

class AppViewModel with ChangeNotifier {
  AppViewModel() {
    changeThemeMode = CommandArgument(_setThemeMode);
    changeLocale = CommandArgument(_setLocale);
  }

  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');

  late CommandArgument<void, ThemeMode?> changeThemeMode;
  late CommandArgument<void, Locale?> changeLocale;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  Future<Result<void>> _setThemeMode(ThemeMode? themeMode) async {
    _themeMode = themeMode ?? _themeMode;
    notifyListeners();

    return const Result.ok(null);
  }

  Future<Result<void>> _setLocale(Locale? locale) async {
    _locale = locale ?? _locale;
    notifyListeners();

    return const Result.ok(null);
  }
}

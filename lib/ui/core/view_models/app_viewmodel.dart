import 'package:flutter/material.dart';

import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../localization/app_localizations.dart';

class AppViewModel with ChangeNotifier {
  AppViewModel() {
    changeThemeMode = Command1(_setThemeMode);
    changeLocale = Command1(_setLocale);
  }

  ThemeMode _themeMode = ThemeMode.values.first;
  Locale _locale = AppLocalizations.supportedLocales.first;

  late Command1<void, ThemeMode?> changeThemeMode;
  late Command1<void, Locale?> changeLocale;

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

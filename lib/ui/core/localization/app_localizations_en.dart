// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get errorWhileLogin => 'Error while trying to login';

  @override
  String get errorWhileLogout => 'Error while trying to logout';

  @override
  String get errorWhileLoadingHome => 'Error while loading home';

  @override
  String get tryAgain => 'Try again';

  @override
  String get confirm => 'Confirm';

  @override
  String textSelected(Object text) {
    return '$text selected';
  }

  @override
  String get search => 'Search';

  @override
  String get login => 'Login';

  @override
  String get welcome => 'Welcome';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get logout => 'Logout';

  @override
  String get home => 'Home';
}

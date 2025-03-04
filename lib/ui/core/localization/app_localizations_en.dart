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
  String get welcome => 'Welcome';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get logout => 'Logout';

  @override
  String get profile => 'Profile';

  @override
  String get home => 'Home';

  @override
  String get letsGetStarted => 'Let\'s Get Started!';

  @override
  String get accountDetails => 'Let\'s dive in into your account';

  @override
  String get signUp => 'Sign up';

  @override
  String get login => 'Log in';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get createAccount => 'Create Your Account';

  @override
  String get elevateHrManagementWithDinosaur => 'Elevate Your HR Management with Dinosaur.';

  @override
  String get haveAccount => 'Already have an acount? ';

  @override
  String get or => 'Or';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get hrTaskManagement => 'Log in and manage your HR tasks with ease';
}

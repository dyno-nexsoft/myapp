import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @errorWhileLogin.
  ///
  /// In en, this message translates to:
  /// **'Error while trying to login'**
  String get errorWhileLogin;

  /// No description provided for @errorWhileSignUp.
  ///
  /// In en, this message translates to:
  /// **'Error while trying to sign up'**
  String get errorWhileSignUp;

  /// No description provided for @errorWhileSaveNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Error while trying to save new password'**
  String get errorWhileSaveNewPassword;

  /// No description provided for @errorWhileLogout.
  ///
  /// In en, this message translates to:
  /// **'Error while trying to logout'**
  String get errorWhileLogout;

  /// No description provided for @errorWhileLoadingHome.
  ///
  /// In en, this message translates to:
  /// **'Error while loading home'**
  String get errorWhileLoadingHome;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @textSelected.
  ///
  /// In en, this message translates to:
  /// **'{text} selected'**
  String textSelected(Object text);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @letsGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started!'**
  String get letsGetStarted;

  /// No description provided for @accountDetails.
  ///
  /// In en, this message translates to:
  /// **'Let\'s dive in into your account'**
  String get accountDetails;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get createAccount;

  /// No description provided for @elevateHrManagementWithDinosaur.
  ///
  /// In en, this message translates to:
  /// **'Elevate Your HR Management with Dinosaur.'**
  String get elevateHrManagementWithDinosaur;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an acount? '**
  String get haveAccount;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @hrTaskManagement.
  ///
  /// In en, this message translates to:
  /// **'Log in and manage your HR tasks with ease'**
  String get hrTaskManagement;

  /// No description provided for @resetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get resetYourPassword;

  /// No description provided for @enterEmailForPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Please enter the email associated with your Dinosaur account. We\'ll send you an OTP code to reset your password.'**
  String get enterEmailForPasswordReset;

  /// No description provided for @sendOtpCode.
  ///
  /// In en, this message translates to:
  /// **'Send OTP Code'**
  String get sendOtpCode;

  /// No description provided for @loginAndManageTasks.
  ///
  /// In en, this message translates to:
  /// **'Log in and manage your HR tasks with ease'**
  String get loginAndManageTasks;

  /// No description provided for @enterOtpCode.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP code'**
  String get enterOtpCode;

  /// No description provided for @checkEmailForOtp.
  ///
  /// In en, this message translates to:
  /// **'Check your email inbox for the OTP code we sent you. Please enter it below to proceed with the password reset.'**
  String get checkEmailForOtp;

  /// No description provided for @resendCodeInSeconds.
  ///
  /// In en, this message translates to:
  /// **'You can resend the code in'**
  String get resendCodeInSeconds;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @secureYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Secure Your Account'**
  String get secureYourAccount;

  /// No description provided for @createNewPasswordInfo.
  ///
  /// In en, this message translates to:
  /// **'Almost there! Create a new password for your Dinosaur account to keep it secure. Remember to choose a strong and unique password.'**
  String get createNewPasswordInfo;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @saveNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Save New Password'**
  String get saveNewPassword;

  /// No description provided for @youreAllSet.
  ///
  /// In en, this message translates to:
  /// **'You\'re All Set!'**
  String get youreAllSet;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your password has been changed successfully.'**
  String get passwordChangedSuccessfully;

  /// No description provided for @goToHomepage.
  ///
  /// In en, this message translates to:
  /// **'Go to Homepage'**
  String get goToHomepage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

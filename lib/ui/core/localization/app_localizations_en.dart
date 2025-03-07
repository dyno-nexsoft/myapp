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
  String get errorWhileSignUp => 'Error while trying to sign up';

  @override
  String get errorWhileSaveNewPassword => 'Error while trying to save new password';

  @override
  String get errorWhileLogout => 'Error while trying to logout';

  @override
  String get errorWhileLoadingHome => 'Error while loading home';

  @override
  String get tryAgain => 'Try again';

  @override
  String get loading => 'Loading...';

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

  @override
  String get resetYourPassword => 'Reset Your Password';

  @override
  String get enterEmailForPasswordReset => 'Please enter the email associated with your Dinosaur account. We\'ll send you an OTP code to reset your password.';

  @override
  String get sendOtpCode => 'Send OTP Code';

  @override
  String get loginAndManageTasks => 'Log in and manage your HR tasks with ease';

  @override
  String get enterOtpCode => 'Enter OTP code';

  @override
  String get checkEmailForOtp => 'Check your email inbox for the OTP code we sent you. Please enter it below to proceed with the password reset.';

  @override
  String get resendCodeInSeconds => 'You can resend the code in';

  @override
  String get seconds => 'seconds';

  @override
  String get resendCode => 'Resend code';

  @override
  String get secureYourAccount => 'Secure Your Account';

  @override
  String get createNewPasswordInfo => 'Almost there! Create a new password for your Dinosaur account to keep it secure. Remember to choose a strong and unique password.';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get saveNewPassword => 'Save New Password';

  @override
  String get youreAllSet => 'You\'re All Set!';

  @override
  String get passwordChangedSuccessfully => 'Congratulations! Your password has been changed successfully.';

  @override
  String get goToHomepage => 'Go to Homepage';

  @override
  String get settings => 'Settings';
}

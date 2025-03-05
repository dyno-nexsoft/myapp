import 'package:flutter/foundation.dart';

import '../../../utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;

  /// Perform sign up
  Future<Result<void>> signUp({
    required String email,
    required String password,
  });

  /// Perform login
  Future<Result<void>> login({required String email, required String password});

  /// Perform forgot password
  Future<Result<void>> setNewPassword({required String password});

  /// Perform logout
  Future<Result<void>> logout();
}

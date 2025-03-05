import '../../../utils/result.dart';
import 'auth_repository.dart';

class AuthRepositoryDev extends AuthRepository {
  bool _isAuthenticated = false;

  /// User is always authenticated in dev scenarios
  @override
  Future<bool> get isAuthenticated => Future.value(_isAuthenticated);

  @override
  Future<Result<void>> signUp({
    required String email,
    required String password,
  }) => login(email: email, password: password);

  /// Login is always successful in dev scenarios
  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    _isAuthenticated = true;
    notifyListeners();

    return const Result.ok(null);
  }

  @override
  Future<Result<void>> setNewPassword({required String password}) =>
      login(email: password, password: password);

  /// Logout is always successful in dev scenarios
  @override
  Future<Result<void>> logout() async {
    _isAuthenticated = false;
    notifyListeners();

    return const Result.ok(null);
  }
}

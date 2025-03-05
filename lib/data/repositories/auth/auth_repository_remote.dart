import '../../../utils/result.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote extends AuthRepository {
  @override
  // TODO: implement isAuthenticated
  Future<bool> get isAuthenticated => throw UnimplementedError();

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> setNewPassword({required String password}) {
    // TODO: implement setNewPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signUp({
    required String email,
    required String password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

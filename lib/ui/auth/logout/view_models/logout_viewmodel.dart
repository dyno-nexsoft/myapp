import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LogoutViewModel {
  LogoutViewModel({required AuthRepository authRepository})
    : _authLogoutRepository = authRepository {
    logout = CommandVoid(_logout);
  }
  final AuthRepository _authLogoutRepository;
  late CommandVoid logout;

  Future<Result> _logout() async {
    final result = await _authLogoutRepository.logout();
    switch (result) {
      case Ok<void>():
        // clear stored itinerary config
        return const Result.ok(null);
      case Error<void>():
        return result;
    }
  }
}

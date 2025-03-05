import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class ForgotPasswordViewModel {
  ForgotPasswordViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    setNewPassword = CommandArgument(_setNewPassword);
  }

  final AuthRepository _authRepository;

  late CommandArgument<void, String> setNewPassword;

  Future<Result<void>> _setNewPassword(String password) async {
    await Future.delayed(const Duration(seconds: 3));

    return _authRepository.setNewPassword(password: password);
  }
}

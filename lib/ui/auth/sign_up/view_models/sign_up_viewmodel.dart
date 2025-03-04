import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class SignUpViewModel {
  SignUpViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    signUp = CommandArgument(_signUp);
  }

  final AuthRepository _authRepository;

  late CommandArgument<void, (String email, String password)> signUp;

  Future<Result<void>> _signUp((String, String) form) async {
    await Future.delayed(const Duration(seconds: 3));

    return _authRepository.signUp(email: form.$1, password: form.$2);
  }
}

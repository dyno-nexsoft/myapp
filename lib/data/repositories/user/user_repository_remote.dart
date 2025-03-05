import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import 'user_repository.dart';

class UserRepositoryRemote implements UserRepository {
  @override
  Future<Result<User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}

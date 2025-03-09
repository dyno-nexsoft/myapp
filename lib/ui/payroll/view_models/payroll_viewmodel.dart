import '../../../utils/command.dart';
import '../../../utils/result.dart';

class PayrollViewModel {
  PayrollViewModel() {
    submit = CommandVoid(_submit);
  }

  late CommandVoid<void> submit;

  Future<Result<void>> _submit() async {
    await Future.delayed(const Duration(seconds: 3));
    return const Result.ok(null);
  }
}

import '../../../utils/command.dart';
import '../../../utils/result.dart';

class PayrollViewModel {
  PayrollViewModel() {
    submit = CommandVoid(_submit);
    submitBalance = CommandVoid(_submitBalance);
  }

  late CommandVoid<void> submit;
  late CommandVoid<void> submitBalance;

  Future<Result<void>> _submit() async {
    await Future.delayed(const Duration(seconds: 3));
    return const Result.ok(null);
  }

  Future<Result<void>> _submitBalance() async {
    await Future.delayed(const Duration(seconds: 3));
    return const Result.ok(null);
  }
}

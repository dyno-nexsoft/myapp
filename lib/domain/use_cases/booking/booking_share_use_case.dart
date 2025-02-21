import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/result.dart';

typedef ShareFunction = Future<void> Function(String text);

/// UseCase for sharing a booking.
class BookingShareUseCase {
  BookingShareUseCase._(this._share);

  /// Create a [BookingShareUseCase] that uses `share_plus` package.
  factory BookingShareUseCase.withSharePlus() =>
      BookingShareUseCase._(Share.share);

  /// Create a [BookingShareUseCase] with a custom share function.
  factory BookingShareUseCase.custom(ShareFunction share) =>
      BookingShareUseCase._(share);

  final ShareFunction _share;
  final _log = Logger('BookingShareUseCase');

  Future<Result<void>> shareText(String text) async {
    _log.info('Sharing booking: $text');
    try {
      await _share(text);
      _log.fine('Shared booking');
      return const Result.ok(null);
    } on Exception catch (error) {
      _log.severe('Failed to share booking', error);
      return Result.error(error);
    }
  }
}

import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  double get paddingHorizontal => 20.0;

  /// General vertical padding used to separate UI items
  double get paddingVertical => 24.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  /// Profile picture size
  double get profilePictureSize;

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) => switch (MediaQuery.sizeOf(
    context,
  ).width) {
    > 600 && < 840 => desktop,
    _ => mobile,
  };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = 20.0;

  @override
  final double paddingScreenVertical = 24.0;

  @override
  final double profilePictureSize = 64.0;

  const _DimensMobile();
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  const _DimensDesktop();
}

extension DimensExt on Dimens {
  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Vertical symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenVertical =>
      EdgeInsets.symmetric(vertical: paddingScreenVertical);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );

  SizedBox get gapHorizontal => SizedBox(width: paddingHorizontal);

  SizedBox get gapVertical => SizedBox(height: paddingVertical);
}

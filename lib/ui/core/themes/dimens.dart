import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) => switch (MediaQuery.sizeOf(
    context,
  ).width) {
    > 600 && < 840 => desktop,
    _ => mobile,
  };

  double get padding => 16.0;

  double get paddingSmall => 8.0;

  double get paddingLarge => 32.0;

  double get paddingScreenHorizontal;

  double get paddingScreenVertical;

  double get profilePictureSize;

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  const _DimensMobile();
  @override
  final double paddingScreenHorizontal = 16.0;

  @override
  final double paddingScreenVertical = 8.0;

  @override
  final double profilePictureSize = 84.0;
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  const _DimensDesktop();
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;
}

extension DimensExt on Dimens {
  EdgeInsetsGeometry get edgeInsetsHorizontal =>
      EdgeInsetsDirectional.symmetric(horizontal: padding);

  EdgeInsetsGeometry get edgeInsetsVertical =>
      EdgeInsetsDirectional.symmetric(vertical: padding);

  EdgeInsetsGeometry get edgeInsetsAll => EdgeInsetsDirectional.all(padding);

  EdgeInsetsGeometry get edgeInsetsAllSmall =>
      EdgeInsetsDirectional.all(paddingSmall);

  EdgeInsetsGeometry get edgeInsetsAllLarge =>
      EdgeInsetsDirectional.all(paddingLarge);

  Widget get gapHorizontal => SizedBox(width: padding);

  Widget get gapHorizontalSmall => SizedBox(width: paddingSmall);

  Widget get gapHorizontalLarge => SizedBox(width: paddingLarge);

  Widget get gapVertical => SizedBox(height: padding);

  Widget get gapVerticalSmall => SizedBox(height: paddingSmall);

  Widget get gapVerticalLarge => SizedBox(height: paddingLarge);

  BorderRadius get borderRadius => BorderRadius.circular(padding);

  BorderRadius get borderRadiusSmall => BorderRadius.circular(paddingSmall);

  BorderRadius get borderRadiusLarge => BorderRadius.circular(paddingLarge);

  EdgeInsetsGeometry get edgeInsetsScreen => EdgeInsetsDirectional.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );
}

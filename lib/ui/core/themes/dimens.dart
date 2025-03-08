import 'package:flutter/material.dart';

sealed class Dimens {
  const Dimens();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) => switch (MediaQuery.sizeOf(
    context,
  ).width) {
    > 840 => const DimensDesktop(),
    > 600 => const DimensTablet(),
    _ => const DimensMobile(),
  };

  double get padding => 16.0;

  double get paddingSmall => 8.0;

  double get paddingLarge => 32.0;

  double get paddingScreenHorizontal;

  double get paddingScreenVertical;

  double get profilePictureSize;
}

/// Mobile dimensions
final class DimensMobile extends Dimens {
  const DimensMobile();

  @override
  final double paddingScreenHorizontal = 16.0;

  @override
  final double paddingScreenVertical = 8.0;

  @override
  final double profilePictureSize = 84.0;
}

/// Tablet dimensions
final class DimensTablet extends Dimens {
  const DimensTablet();

  @override
  final double paddingScreenHorizontal = 64.0;

  @override
  final double paddingScreenVertical = 32.0;

  @override
  final double profilePictureSize = 100.0;
}

/// Desktop/Web dimensions
final class DimensDesktop extends Dimens {
  const DimensDesktop();

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

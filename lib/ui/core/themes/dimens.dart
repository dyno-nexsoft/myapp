import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  double get paddingDefault => 16.0;

  double get paddingScreenHorizontal;

  double get paddingScreenVertical;

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
  final double paddingScreenHorizontal = 16.0;

  @override
  final double paddingScreenVertical = 8.0;

  @override
  final double profilePictureSize = 84.0;

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
  EdgeInsetsGeometry get edgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingDefault);

  EdgeInsetsGeometry get edgeInsetsVertical =>
      EdgeInsets.symmetric(vertical: paddingDefault);

  EdgeInsetsGeometry get edgeInsetsAll => EdgeInsets.all(paddingDefault);

  Widget get gapHorizontal => SizedBox(width: paddingDefault);

  Widget get gapHorizontalSmall => SizedBox(width: paddingDefault / 2);

  Widget get gapVertical => SizedBox(height: paddingDefault);

  Widget get gapVerticalSmall => SizedBox(height: paddingDefault / 2);

  BorderRadiusGeometry get borderRadiusStart =>
      BorderRadiusDirectional.horizontal(
        start: Radius.circular(paddingDefault),
      );

  BorderRadiusGeometry get borderRadiusEnd =>
      BorderRadiusDirectional.horizontal(end: Radius.circular(paddingDefault));

  BorderRadiusGeometry get borderRadiusTop =>
      BorderRadiusDirectional.vertical(top: Radius.circular(paddingDefault));

  BorderRadiusGeometry get borderRadiusBottom =>
      BorderRadius.vertical(bottom: Radius.circular(paddingDefault));

  BorderRadius get borderRadiusAll => BorderRadius.circular(paddingDefault);

  EdgeInsetsGeometry get edgeInsetsScreen => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );
}

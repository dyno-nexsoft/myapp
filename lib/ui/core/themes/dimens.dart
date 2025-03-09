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

  bool get isMobile => this is DimensMobile;

  bool get isTablet => this is DimensTablet;

  bool get isDesktop => this is DimensDesktop;

  /// Auto add leading button at detail screen
  bool get automaticallyImplyLeading => true;

  double get padding => 16.0;

  double get paddingSmall => 8.0;

  double get paddingLarge => 32.0;

  double get profilePictureSize;

  int get homeMenuCount;

  double get payrollCardWidth;
}

/// Mobile dimensions
final class DimensMobile extends Dimens {
  const DimensMobile();

  @override
  final double profilePictureSize = 80.0;

  @override
  int get homeMenuCount => 4;

  @override
  double get payrollCardWidth => double.infinity;
}

/// Tablet dimensions
final class DimensTablet extends Dimens {
  const DimensTablet();

  @override
  final double profilePictureSize = 90.0;

  @override
  int get homeMenuCount => 8;

  @override
  double get payrollCardWidth => 600;
}

/// Desktop/Web dimensions
final class DimensDesktop extends Dimens {
  const DimensDesktop();

  @override
  bool get automaticallyImplyLeading => false;

  @override
  final double profilePictureSize = 100.0;

  @override
  int get homeMenuCount => 8;

  @override
  double get payrollCardWidth => 840;
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
}

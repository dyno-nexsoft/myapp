import 'package:flutter/material.dart';

class AdaptiveSlider extends StatelessWidget {
  const AdaptiveSlider({
    super.key,
    required this.value,
    this.secondaryTrackValue,
    this.onChanged,
  });

  final double value;
  final double? secondaryTrackValue;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: value,
      secondaryTrackValue: secondaryTrackValue,
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';

class AdaptiveRadio<T> extends StatelessWidget {
  const AdaptiveRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<T>.adaptive(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

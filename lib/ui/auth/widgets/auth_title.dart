import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: TextTheme.of(context).headlineLarge),
        Dimens.of(context).gapVertical,
        Text(
          subtitle,
          style: TextTheme.of(
            context,
          ).bodyLarge,
          textAlign: switch (crossAxisAlignment) {
            CrossAxisAlignment.start => TextAlign.start,
            CrossAxisAlignment.end => TextAlign.end,
            CrossAxisAlignment.center => TextAlign.center,
            CrossAxisAlignment() => null,
          },
        ),
      ],
    );
  }
}

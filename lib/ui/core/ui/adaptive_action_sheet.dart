import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_dialog.dart';

class AdaptiveActionSheet extends StatelessWidget {
  const AdaptiveActionSheet({
    super.key,
    this.title,
    this.content,
    this.actions,
    required this.useRootNavigator,
  });

  final Widget? title;
  final Widget? content;
  final ActionBuilder? actions;
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Column(
          spacing: 16,
          children: [
            if (title != null) title!,
            if (content != null) content!,
            if (actions != null) ...actions!.call(context, useRootNavigator),
          ],
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoActionSheet(
          title: title,
          message: content,
          actions: actions?.call(context, useRootNavigator),
        );
    }
  }
}

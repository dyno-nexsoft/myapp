import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/dimens.dart';

typedef ActionBuilder =
    List<AdaptiveActionSheetAction> Function(
      BuildContext context,
      bool rootNavigator,
    );

class AdaptiveActionSheetAction extends CupertinoActionSheetAction {
  const AdaptiveActionSheetAction({
    super.key,
    super.isDefaultAction,
    super.isDestructiveAction,
    required super.onPressed,
    required super.child,
  });
}

class AdaptiveActionSheet extends StatelessWidget {
  const AdaptiveActionSheet({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.rootNavigator = true,
    this.barrierDismissible = true,
  });

  final Widget? title;
  final Widget? content;
  final ActionBuilder? actions;
  final bool rootNavigator;
  final bool barrierDismissible;

  Future<T?> show<T>(BuildContext context) => switch (Theme.of(
    context,
  ).platform) {
    TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoModalPopup<T>(
      context: context,
      useRootNavigator: rootNavigator,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => this,
    ),

    TargetPlatform() => showModalBottomSheet<T>(
      context: context,
      useRootNavigator: rootNavigator,
      isDismissible: barrierDismissible,
      enableDrag: barrierDismissible,
      builder: (BuildContext context) => this,
      isScrollControlled: true,
    ),
  };

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: Dimens.of(context).edgeInsetsAll,
          children: [
            if (title != null) ...[
              Center(
                child: DefaultTextStyle.merge(
                  style: TextTheme.of(context).titleMedium,
                  child: title!,
                ),
              ),
              Dimens.of(context).gapVertical,
            ],
            if (content != null) ...[
              Center(
                child: DefaultTextStyle.merge(
                  style: TextTheme.of(context).bodyMedium,
                  child: content!,
                ),
              ),
              Dimens.of(context).gapVertical,
            ],
            if (actions != null)
              ...actions!
                  .call(context, rootNavigator)
                  .map(
                    (e) => DefaultTextStyle.merge(
                      style: TextStyle(
                        fontWeight: e.isDefaultAction ? FontWeight.bold : null,
                        color:
                            e.isDestructiveAction
                                ? ColorScheme.of(context).error
                                : e.isDefaultAction
                                ? ColorScheme.of(context).primary
                                : null,
                      ),
                      child: e.child,
                    ),
                  ),
          ],
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoActionSheet(
          title: title,
          message: content,
          actions: actions?.call(context, rootNavigator),
        );
    }
  }
}

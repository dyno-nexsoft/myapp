import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ActionBuilder =
    List<AdaptiveDialogAction> Function(
      BuildContext context,
      bool rootNavigator,
    );

class AdaptiveDialogAction extends CupertinoDialogAction {
  const AdaptiveDialogAction({
    super.key,
    super.onPressed,
    super.isDefaultAction = false,
    super.isDestructiveAction = false,
    super.textStyle,
    required super.child,
  });
}

class AdaptiveDialog extends StatelessWidget {
  const AdaptiveDialog({
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

  /// Displays either a Material or Cupertino dialog depending on platform.
  Future<T?> show<T>(BuildContext context) => showAdaptiveDialog<T>(
    context: context,
    useRootNavigator: rootNavigator,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) => this,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: title,
      content: content,
      actions:
          actions
              ?.call(context, rootNavigator)
              .map(
                (action) => switch (Theme.of(context).platform) {
                  TargetPlatform.android ||
                  TargetPlatform.fuchsia ||
                  TargetPlatform.linux ||
                  TargetPlatform.windows => TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      textStyle: action.textStyle,
                      backgroundColor: switch (action) {
                        AdaptiveDialogAction(isDestructiveAction: true) =>
                          ColorScheme.of(context).error,
                        AdaptiveDialogAction(isDefaultAction: true) =>
                          ColorScheme.of(context).primary,
                        AdaptiveDialogAction() => null,
                      },
                      foregroundColor: switch (action) {
                        AdaptiveDialogAction(isDestructiveAction: true) =>
                          ColorScheme.of(context).onError,
                        AdaptiveDialogAction(isDefaultAction: true) =>
                          ColorScheme.of(context).onPrimary,
                        AdaptiveDialogAction() => null,
                      },
                    ),
                    onPressed: action.onPressed,
                    child: action.child,
                  ),
                  TargetPlatform.iOS || TargetPlatform.macOS => action,
                },
              )
              .toList(),
    );
  }
}

import 'package:flutter/material.dart';

typedef ActionBuilder =
    List<Widget> Function(BuildContext context, bool rootNavigator);

class AdaptiveDialog extends StatelessWidget {
  const AdaptiveDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.rootNavigator = true,
  });

  final Widget? title;
  final Widget? content;
  final ActionBuilder? actions;
  final bool rootNavigator;

  /// Displays either a Material or Cupertino dialog depending on platform.
  Future<T?> show<T>(BuildContext context) => showAdaptiveDialog<T>(
    context: context,
    useRootNavigator: rootNavigator,
    builder: (BuildContext context) => this,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: title,
      content: content,
      actions: actions?.call(context, rootNavigator),
    );
  }
}

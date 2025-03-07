import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/command.dart';
import '../localization/app_localizations.dart';
import '../themes/dimens.dart';
import 'adaptive_dialog.dart';
import 'blur_filter.dart';

typedef ErrorIndicatorWidgetListener = void Function(BuildContext context);

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
    required this.title,
    this.onPressed,
    this.label,
  });

  const factory ErrorIndicator.builder({
    Key? key,
    required String title,
    String? label,
    VoidCallback? onPressed,
    required Command<dynamic> command,
    String? titleLoading,
    TransitionBuilder? builder,
    Widget? child,
  }) = ErrorIndicatorBuilder;

  const factory ErrorIndicator.listener({
    Key? key,
    required String title,
    String? label,
    VoidCallback? onPressed,
    required Command<dynamic> command,
    String? titleLoading,
    TransitionBuilder? builder,
    Widget? child,
    ErrorIndicatorWidgetListener? listener,
  }) = ErrorIndicatorListener;

  final String title;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IntrinsicWidth(
          child: Padding(
            padding: Dimens.of(context).edgeInsetsAll,
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (onPressed != null) ...[
          const SizedBox(height: 10),
          FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.error,
              ),
              foregroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onError,
              ),
            ),
            child: Text(label ?? AppLocalizations.of(context).tryAgain),
          ),
        ],
      ],
    );
  }
}

class ErrorIndicatorBuilder extends ErrorIndicator {
  const ErrorIndicatorBuilder({
    super.key,
    required super.title,
    super.label,
    super.onPressed,
    required this.command,
    this.titleLoading,
    this.builder,
    this.child,
  });

  final Command command;
  final String? titleLoading;
  final TransitionBuilder? builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: command,
      builder: _builder,
      child: child,
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    if (command.running) {
      return Center(child: _buildRunning(context));
    }
    if (command.error) {
      return Center(child: super.build(context));
    }
    return builder?.call(context, child) ?? child ?? const SizedBox();
  }

  Widget _buildRunning(BuildContext context) => BackdropFilter(
    filter: kBlurFilter,
    child: AdaptiveDialog(
      title: const Center(
        child: SizedBox.square(
          dimension: 48,
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      content: Text(
        titleLoading ?? AppLocalizations.of(context).loading,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

class ErrorIndicatorListener extends ErrorIndicatorBuilder {
  const ErrorIndicatorListener({
    super.key,
    required super.title,
    super.label,
    super.onPressed,
    super.titleLoading,
    required super.command,
    super.builder,
    super.child,
    this.listener,
  });

  final ErrorIndicatorWidgetListener? listener;

  @override
  Widget _builder(BuildContext context, Widget? child) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      listener?.call(context);
      if (command.running) {
        await showAdaptiveDialog(
          barrierDismissible: false,
          context: context,
          builder: super._buildRunning,
        );
      } else if (command.error) {
        await showAdaptiveDialog(
          barrierDismissible: false,
          context: context,
          builder: super.build,
        );
      }
    });
    return super.builder?.call(context, child) ?? child ?? const SizedBox();
  }
}

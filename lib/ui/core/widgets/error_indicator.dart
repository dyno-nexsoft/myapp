import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/command.dart';
import '../localization/app_localizations.dart';
import '../themes/dimens.dart';
import 'adaptive_dialog.dart';
import 'blur_filter.dart';

typedef ErrorIndicatorOnCompleted =
    FutureOr<void> Function(BuildContext context);

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

  const factory ErrorIndicator.dialog({
    Key? key,
    required String title,
    String? label,
    VoidCallback? onPressed,
    required Command<dynamic> command,
    String? titleLoading,
    TransitionBuilder? builder,
    Widget? child,
    ErrorIndicatorOnCompleted? onCompleted,
  }) = ErrorIndicatorListener;

  final String title;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => _buildError(context);

  Widget _buildError(BuildContext context) {
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
                    color: ColorScheme.of(context).error,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(color: ColorScheme.of(context).error),
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
                ColorScheme.of(context).error,
              ),
              foregroundColor: WidgetStatePropertyAll(
                ColorScheme.of(context).onError,
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
      return Center(child: _buildError(context));
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
    this.onCompleted,
  });

  final ErrorIndicatorOnCompleted? onCompleted;

  @override
  Widget _builder(BuildContext context, Widget? child) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (command.running) {
        await showAdaptiveDialog(
          barrierDismissible: false,
          context: context,
          builder: super._buildRunning,
        );
      } else if (command.completed) {
        Navigator.of(context, rootNavigator: true).pop();
        await onCompleted?.call(context);
        command.clearResult();
      } else if (command.error) {
        Navigator.of(context, rootNavigator: true).pop();
        await showAdaptiveDialog(context: context, builder: super._buildError);
        command.clearResult();
      }
    });
    return super.builder?.call(context, child) ?? child ?? const SizedBox();
  }
}

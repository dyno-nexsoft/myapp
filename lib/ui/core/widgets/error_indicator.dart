import 'package:flutter/material.dart';

import '../../../utils/command.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
    required this.title,
    required this.label,
    required this.onPressed,
  });

  factory ErrorIndicator.builder({
    Key? key,
    required String title,
    required String label,
    required CommandVoid command,
    required Widget child,
  }) = ErrorIndicatorBuilder;

  final String title;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
          child: Text(label),
        ),
      ],
    );
  }
}

class ErrorIndicatorBuilder extends ErrorIndicator {
  ErrorIndicatorBuilder({
    super.key,
    required super.title,
    required super.label,
    required this.command,
    required this.child,
  }) : super(onPressed: command.execute);

  final CommandVoid command;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: command,
      builder: (context, child) {
        if (command.running) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (command.error) {
          return Center(child: super.build(context));
        }
        return child!;
      },
      child: child,
    );
  }
}

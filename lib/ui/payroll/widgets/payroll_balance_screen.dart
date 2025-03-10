import 'package:flutter/material.dart';

import '../view_models/payroll_viewmodel.dart';
import 'payroll_balance_select_screen.dart';

class PayrollBalanceScreen extends StatelessWidget {
  const PayrollBalanceScreen({
    super.key,
    required this.viewModel,
    required this.type,
  });

  final PayrollViewModel viewModel;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorScheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: ColorScheme.of(context).primary,
        foregroundColor: ColorScheme.of(context).onPrimary,
        surfaceTintColor: ColorScheme.of(context).onPrimary,
        title: Text(type),
      ),
      body: DefaultTextStyle.merge(
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: ColorScheme.of(context).onPrimary),
        child: Column(
          children: [
            const Spacer(),
            const Text('Enter Amount to Top Up'),
            const Spacer(flex: 3),
            TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextTheme.of(context).headlineMedium?.copyWith(
                color: ColorScheme.of(context).onPrimary,
              ),
              cursorWidth: 4,
              cursorColor: ColorScheme.of(context).onPrimary,
              decoration: const InputDecoration(
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
            const Spacer(),
            const Text(r'Available balance: $958,476.50'),
            const Spacer(flex: 3),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FilledButton(
          onPressed:
              () => Navigator.of(context).push(
                MaterialPage(
                  child: PayrollBalanceSelectScreen(
                    viewModel: viewModel,
                    type: type,
                  ),
                ).createRoute(context),
              ),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

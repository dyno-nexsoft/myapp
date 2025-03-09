import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: Text(type),
      ),
      body: const Center(child: Text('Payroll Balance Screen')),
    );
  }
}

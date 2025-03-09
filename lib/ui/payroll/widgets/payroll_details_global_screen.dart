import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollDetailsGlobalScreen extends StatelessWidget {
  const PayrollDetailsGlobalScreen({super.key, required this.viewModel});

  final PayrollViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: const Text('Payroll Detail'),
      ),
    );
  }
}

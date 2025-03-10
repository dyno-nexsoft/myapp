import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/employees_viewmodel.dart';

class EmployeesEmptyCard extends StatelessWidget {
  const EmployeesEmptyCard({super.key, required this.viewModel});

  final EmployeesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.of(context).padding,
      children: [
        Center(child: AppAssets.images.employeesEmptyBg.image(height: 150)),
        Text('Empty', style: TextTheme.of(context).titleLarge),
        Text(
          "You haven't added departments and\n"
          'employees yet.',
          style: TextTheme.of(context).bodyMedium,
          textAlign: TextAlign.center,
        ),
        FilledButton.icon(
          onPressed: () => viewModel.addEmployee('employee'),
          icon: const Icon(Icons.add),
          label: const Text('Add new'),
        ),
      ],
    );
  }
}

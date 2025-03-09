import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollDetailsScreen extends StatelessWidget {
  const PayrollDetailsScreen({super.key, required this.viewModel});

  final PayrollViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: const Text('Payroll Detail'),
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          titleTextStyle: TextTheme.of(context).bodyLarge,
          leadingAndTrailingTextStyle: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsetsDirectional.zero,
          dense: true,
        ),
        child: ListView(
          padding: Dimens.of(context).edgeInsetsHorizontal,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundImage: AppAssets.images.user.provider(),
              ),
              titleTextStyle: TextTheme.of(context).titleMedium,
              title: const Row(
                children: [Expanded(child: Text('Jenny Wilson')), Text(r'$60')],
              ),
              subtitleTextStyle: TextTheme.of(context).bodyMedium,
              subtitle: const Row(
                children: [
                  Expanded(child: Text('Product - Product Manager')),
                  Text(r'/hour'),
                ],
              ),
            ),
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Hours'),
              title: const Divider(),
            ),
            const ListTile(
              title: Text('Hours Worked'),
              trailing: Text('160.00 hrs'),
            ),
            const ListTile(
              leading: Text('Overtime'),
              trailing: Text.rich(
                TextSpan(
                  text: 'O hr ',
                  children: [WidgetSpan(child: Icon(Icons.edit, size: 18))],
                ),
              ),
            ),
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Additional Earnings'),
              title: const Divider(),
            ),
            ListTile(
              title: const Text('Bonus'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            ListTile(
              title: const Text('Commission'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            ListTile(
              title: const Text('Other'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Time Off'),
              title: const Divider(),
            ),
            const ListTile(
              title: Text('Paid Time Off (PTO)'),
              trailing: Text.rich(
                TextSpan(
                  text: 'O hr ',
                  children: [WidgetSpan(child: Icon(Icons.edit, size: 18))],
                ),
              ),
            ),
            const ListTile(
              title: Text('Sick Hours'),
              trailing: Text.rich(
                TextSpan(
                  text: 'O hr ',
                  children: [WidgetSpan(child: Icon(Icons.edit, size: 18))],
                ),
              ),
            ),
            const ListTile(
              title: Text('Paid Holiday Hours'),
              trailing: Text.rich(
                TextSpan(
                  text: 'O hr ',
                  children: [WidgetSpan(child: Icon(Icons.edit, size: 18))],
                ),
              ),
            ),
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Review'),
              title: const Divider(),
            ),
            ListTile(
              title: const Text('Reimbursements'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            ListTile(
              title: const Text('Company Benefits'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            const ListTile(
              title: Text('Gross Pay'),
              trailing: Text(r'$9,600.00'),
            ),
            const ListTile(
              title: Text('Taxes (15%)'),
              trailing: Text(r'- $1,440.00'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Total Payroll'),
              trailing: Text(r'$8,160.00'),
            ),
            BottomAppBar(
              child: FilledButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

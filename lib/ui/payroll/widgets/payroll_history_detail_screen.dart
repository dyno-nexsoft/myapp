import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollHistoryDetailScreen extends StatelessWidget {
  const PayrollHistoryDetailScreen({
    super.key,
    required this.viewModel,
    required this.id,
  });

  final PayrollViewModel viewModel;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: const Text('Payroll Summary'),
        actions: [
          IconButton(
            onPressed:
                () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: Dimens.of(context).edgeInsetsAllSmall,
                    content: const Text('Salary Slip downloaded...'),
                    action: SnackBarAction(label: 'Open', onPressed: () {}),
                  ),
                ),
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).bodyMedium,
          leadingAndTrailingTextStyle: TextTheme.of(
            context,
          ).titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        child: ListView(
          children: [
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelSmall?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Payroll Summary'),
              title: const Divider(),
            ),
            const ListTile(
              title: Text('Subtotal Reimbursements'),
              trailing: Text(r'$2,568.00'),
            ),
            const ListTile(
              title: Text('Subtotal Company Benefits'),
              trailing: Text(r'$1,746.00'),
            ),
            const ListTile(
              title: Text('Subtotal Gross Pay'),
              trailing: Text(r'$190,584.00'),
            ),
            const ListTile(
              title: Text('Subtotal Taxes'),
              trailing: Text(r'- $28,587.60'),
            ),
            const ListTile(
              title: Text('Total Payroll'),
              trailing: Text(r'$164,564.40'),
            ),
            const ListTile(title: Divider()),
            const ListTile(
              title: Text('Payment Time'),
              trailing: Text(r'09:41:56 AM'),
            ),
            const ListTile(
              title: Text('Payment Date'),
              trailing: Text(r'December 31, 2023'),
            ),
            const ListTile(
              title: Text('Payroll ID'),
              trailing: Text.rich(
                TextSpan(
                  text: r'PID12312023TRX ',
                  children: [WidgetSpan(child: Icon(Icons.copy, size: 18))],
                ),
              ),
            ),
            ListTile(
              title: const Text('Status'),
              trailing: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorScheme.of(context).primary),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('SUCCESS'),
                ),
              ),
            ),
            ..._buildItems(context),
            ..._buildItems(context),
            ..._buildItems(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) => List.generate(6, (index) {
    if (index == 0) {
      return ListTile(
        leadingAndTrailingTextStyle: TextTheme.of(
          context,
        ).labelSmall?.copyWith(color: DividerTheme.of(context).color),
        leading: const Text('Product'),
        title: const Divider(),
      );
    }
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundImage: AppAssets.images.user.provider(),
      ),
      title: const Text('Jenny Wilson'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(r'$9,600.00'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
    );
  });
}

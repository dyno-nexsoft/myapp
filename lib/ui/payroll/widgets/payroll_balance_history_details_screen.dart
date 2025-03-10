import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollBalanceHistoryDetailsScreen extends StatelessWidget {
  const PayrollBalanceHistoryDetailsScreen({
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
        title: Text('$id Details'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
        ],
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).bodyMedium,
          leadingAndTrailingTextStyle: TextTheme.of(context).titleMedium,
        ),
        child: Column(
          children: [
            const ListTile(
              title: Text('Transaction Amount'),
              trailing: Text(r'$25,000.00'),
            ),
            ListTile(title: const Text('Transaction Type'), trailing: Text(id)),
            const ListTile(
              title: Text('Origin'),
              trailing: Text(r'MasterCard (...4679)'),
            ),
            const ListTile(
              title: Text('Transaction Time'),
              trailing: Text(r'09:41:56 AM'),
            ),
            const ListTile(
              title: Text('Transaction Date'),
              trailing: Text(r'December 31, 2023'),
            ),
            const ListTile(
              title: Text('Transaction ID'),
              trailing: Text.rich(
                TextSpan(
                  text: r'TID12312023TU ',
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
                  child: Text(r'SUCCESS'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

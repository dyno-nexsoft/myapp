import 'package:flutter/material.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollHistoryScreen extends StatelessWidget {
  const PayrollHistoryScreen({super.key, required this.viewModel});

  final PayrollViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          SearchAnchor(
            isFullScreen: !Dimens.of(context).isDesktop,
            builder: (context, controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: controller.openView,
              );
            },
            suggestionsBuilder: (context, controller) {
              return List<ListTile>.generate(5, (int index) {
                final item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () => controller.closeView(item),
                );
              });
            },
          ),
        ],
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).titleMedium,
          subtitleTextStyle: TextTheme.of(context).bodySmall,
        ),
        child: ListView.builder(itemBuilder: _itemBuilder),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      onTap:
          () => PayrollHistoryDetailRoute(
            id: '$index',
            $extra: viewModel,
          ).go(context),
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: DividerTheme.of(context).color ?? Colors.grey,
          ),
        ),
        child: Padding(
          padding: Dimens.of(context).edgeInsetsAllSmall,
          child: const Icon(Icons.paid_outlined),
        ),
      ),
      title: const Text(r'Payroll - $164,564.40'),
      subtitle: const Text('Paid at 09:41 AM, December 31 2023'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

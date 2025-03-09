import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollBalanceHistoryScreen extends StatelessWidget {
  const PayrollBalanceHistoryScreen({super.key, required this.viewModel});

  final PayrollViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: const Text('History'),
        actions: [
          SearchAnchor(
            isFullScreen: Dimens.of(context).isMobile,
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
      onTap: () {},
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: DividerTheme.of(context).color ?? Colors.grey,
          ),
        ),
        child: Padding(
          padding: Dimens.of(context).edgeInsetsAllSmall,
          child:
              index.isEven
                  ? const Icon(Icons.input_outlined)
                  : const Icon(Icons.output_outlined),
        ),
      ),
      title:
          index.isEven
              ? const Text(r'Top up - $25,000.00')
              : const Text(r'Withdraw - $50,000.00'),
      subtitle: const Text('Succeeded at 09:41 AM, December 31 2023'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

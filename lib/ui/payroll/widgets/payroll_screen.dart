import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key, required this.viewModel});

  final PayrollViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll'),
        actions: [
          IconButton(
            onPressed: () => const PayrollHistoryRoute().go(context),
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).titleMedium,
          subtitleTextStyle: TextTheme.of(context).bodySmall,
          leadingAndTrailingTextStyle: TextTheme.of(context).titleMedium,
        ),
        child: ListView(
          children: [
            _buildCard(context),
            ..._buildItems(context),
            ..._buildItems(context),
            ..._buildItems(context),
            BottomAppBar(
              child: FilledButton(
                onPressed:
                    () => PayrollDetailsGlobalRoute(
                      $extra: viewModel,
                    ).go(context),
                child: const Text('Submit Payroll'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Center(
      child: Container(
        width: Dimens.of(context).payrollCardWidth,
        margin: Dimens.of(context).edgeInsetsHorizontal,
        padding: Dimens.of(context).edgeInsetsAll,
        decoration: BoxDecoration(
          color: ColorScheme.of(context).primaryContainer,
          borderRadius: Dimens.of(context).borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.of(context).padding,
          children: [
            Row(
              children: [
                Text(
                  'Your balance',
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: ColorScheme.of(context).onPrimaryContainer,
                  ),
                ),
                IconButton(
                  color: ColorScheme.of(context).onPrimary,
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined),
                ),
                const Spacer(),
                AppAssets.images.masterCard.image(height: 32),
                Dimens.of(context).gapHorizontalSmall,
                AppAssets.images.visa.image(height: 32),
              ],
            ),
            Text(
              r'$958,476.50',
              style: TextTheme.of(context).headlineMedium?.copyWith(
                color: ColorScheme.of(context).onPrimaryContainer,
              ),
            ),
            Row(
              spacing: Dimens.of(context).paddingSmall,
              children: [
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorScheme.of(context).onPrimary,
                      foregroundColor: ColorScheme.of(context).primary,
                      iconColor: ColorScheme.of(context).primary,
                    ),
                    onPressed:
                        () => PayrollBalanceRoute(
                          type: 'Top Up',
                          $extra: viewModel,
                        ).go(context),
                    icon: const Icon(Icons.input_outlined),
                    label: const Text('Top Up', maxLines: 1),
                  ),
                ),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorScheme.of(context).onPrimary,
                      foregroundColor: ColorScheme.of(context).primary,
                      iconColor: ColorScheme.of(context).primary,
                    ),
                    onPressed:
                        () => PayrollBalanceRoute(
                          type: 'Withdraw',
                          $extra: viewModel,
                        ).go(context),
                    icon: const Icon(Icons.output_outlined),
                    label: const Text('Withdraw', maxLines: 1),
                  ),
                ),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorScheme.of(context).onPrimary,
                      foregroundColor: ColorScheme.of(context).primary,
                      iconColor: ColorScheme.of(context).primary,
                    ),
                    onPressed:
                        () => PayrollBalanceHistoryRoute(
                          $extra: viewModel,
                        ).go(context),
                    icon: const Icon(Icons.history_outlined),
                    label: const Text('History', maxLines: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) => List.generate(6, (index) {
    if (index == 0) {
      return const ListTile(leading: Text('Product'), title: Divider());
    }

    return ListTile(
      onTap: () => PayrollDetailsRoute(id: 'id', $extra: viewModel).go(context),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AppAssets.images.user.provider(),
      ),
      title: const Text('Jenny Wilson'),
      subtitle: const Text('Product Manager'),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(r'$9,600'), Icon(Icons.chevron_right)],
      ),
    );
  });
}

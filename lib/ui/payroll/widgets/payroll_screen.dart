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
      appBar: AppBar(title: const Text('Payroll')),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          titleTextStyle: TextTheme.of(context).titleMedium,
          subtitleTextStyle: TextTheme.of(context).bodyMedium,
          contentPadding: EdgeInsetsDirectional.zero,
        ),
        child: ListView(
          padding: Dimens.of(context).edgeInsetsHorizontal,
          children: [
            _buildCard(context),
            ..._buildItems(context),
            ..._buildItems(context),
            ..._buildItems(context),
            BottomAppBar(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Submit Payroll'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: Dimens.of(context).borderRadius,
      ),
      child: Padding(
        padding: Dimens.of(context).edgeInsetsAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.of(context).padding,
          children: [
            Row(
              children: [
                Text(
                  'Your balance',
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            Row(
              spacing: Dimens.of(context).paddingSmall,
              children: [
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      iconColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.download_outlined),
                    label: const Text('Top Up', maxLines: 1),
                  ),
                ),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      iconColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.logout_outlined),
                    label: const Text('Withdraw', maxLines: 1),
                  ),
                ),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      iconColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {},
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

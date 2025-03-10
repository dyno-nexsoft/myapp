import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/themes/dimens.dart';
import '../../core/widgets/adaptive_dialog.dart';
import '../../core/widgets/error_indicator.dart';
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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          visualDensity: VisualDensity.compact,
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).titleMedium,
          leadingAndTrailingTextStyle: TextTheme.of(
            context,
          ).titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        child: ListView(
          children: [
            ..._buildItems(context),
            ..._buildItems(context),
            ..._buildItems(context),
            ListTile(
              leadingAndTrailingTextStyle: TextTheme.of(
                context,
              ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
              leading: const Text('Review'),
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
              title: Text('Subtotal Cross Pay'),
              trailing: Text(r'$190,584.00'),
            ),
            const ListTile(
              title: Text('Subtotal Taxes'),
              trailing: Text(r'- $28,587.60'),
            ),
            const ListTile(title: Divider()),
            const ListTile(
              title: Text('Total Payroll'),
              trailing: Text(r'$164,564.40'),
            ),
            BottomAppBar(
              child: ErrorIndicator.dialog(
                command: viewModel.submit,
                title: AppLocalizations.of(context).errorWhileSubmitPayroll,
                titleLoading: 'Processing Payments...',
                onCompleted:
                    AdaptiveDialog(
                      title: const Text('Payroll Successful!'),
                      content: const Text(
                        'Congratulations! Your payroll has been successfully processed.',
                      ),
                      actions:
                          (context, rootNavigator) => [
                            AdaptiveDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                PayrollHistoryDetailRoute(
                                  id: 'id',
                                  $extra: viewModel,
                                ).go(context);
                                Navigator.of(context).pop();
                              },
                              child: const Text('View Payroll Summary'),
                            ),
                            AdaptiveDialogAction(
                              onPressed: () {
                                const HomeRoute().go(context);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Go to Home'),
                            ),
                          ],
                    ).show,
                child: FilledButton(
                  onPressed: viewModel.submit.execute,
                  child: const Text('Confirm & Submit Payroll'),
                ),
              ),
            ),
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
        ).labelMedium?.copyWith(color: DividerTheme.of(context).color),
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
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(r'$9,600.00'), Icon(Icons.chevron_right)],
      ),
    );
  });
}

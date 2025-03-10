import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/themes/dimens.dart';
import '../../core/widgets/adaptive_dialog.dart';
import '../../core/widgets/error_indicator.dart';
import '../view_models/payroll_viewmodel.dart';

class PayrollBalanceSummaryScreen extends StatelessWidget {
  const PayrollBalanceSummaryScreen({
    super.key,
    required this.viewModel,
    required this.type,
  });

  final PayrollViewModel viewModel;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Summary')),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsAllSmall,
          titleTextStyle: TextTheme.of(context).titleMedium,
          shape: RoundedRectangleBorder(
            borderRadius: Dimens.of(context).borderRadius,
            side: BorderSide(
              color: DividerTheme.of(context).color ?? Colors.grey,
            ),
          ),
          selectedColor: ColorScheme.of(context).onSecondary,
          selectedTileColor: ColorScheme.of(context).secondary,
        ),
        child: Padding(
          padding: Dimens.of(context).edgeInsetsAll,
          child: Column(
            children: [
              ListTile(
                minVerticalPadding: Dimens.of(context).paddingLarge,
                shape: CardTheme.of(context).shape,
                titleTextStyle: TextTheme.of(context).bodyMedium,
                subtitleTextStyle: TextTheme.of(context).headlineMedium,
                title: Center(child: Text('Amount to $type')),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: Dimens.of(context).padding),
                  child: const Center(child: Text(r'$50,000.00')),
                ),
              ),
              ListTile(
                shape: const RoundedRectangleBorder(),
                title: Text('Selected $type Destination'),
              ),
              ListTile(
                leading: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: DividerTheme.of(context).color ?? Colors.grey,
                    ),
                  ),
                  child: Padding(
                    padding: Dimens.of(context).edgeInsetsAllSmall,
                    child: AppAssets.images.masterCard.image(),
                  ),
                ),
                title: const Text('.... .... .... .... 4679'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ErrorIndicator.dialog(
          command: viewModel.submitBalance,
          title: AppLocalizations.of(
            context,
          ).errorWhileSubmitPayrollBalanceType(type),
          onCompleted:
              AdaptiveDialog(
                barrierDismissible: false,
                title: Text('$type Successful!'),
                content: Text(
                  r'The amount of $50,000.00 has been '
                  '$type from your balance.',
                ),
                actions:
                    (context, rootNavigator) => [
                      AdaptiveDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          PayrollBalanceHistoryRoute(
                            $extra: viewModel,
                          ).go(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
              ).show,
          child: FilledButton(
            onPressed: viewModel.submitBalance.execute,
            child: const Text('Confirm Withdraw'),
          ),
        ),
      ),
    );
  }
}

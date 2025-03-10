import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/payroll_viewmodel.dart';
import 'payroll_balance_summary_screen.dart';

class PayrollBalanceSelectScreen extends StatelessWidget {
  const PayrollBalanceSelectScreen({
    super.key,
    required this.viewModel,
    required this.type,
  });

  final PayrollViewModel viewModel;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select $type Destination'),
        actions: const [
          IconButton(
            onPressed: null, // TODO: Add screen payment method
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
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
        child: ListView(
          padding: Dimens.of(context).edgeInsetsAll,
          children: [
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
                  child: AppAssets.images.payPal.image(),
                ),
              ),
              title: const Text('PayPal'),
            ),
            Dimens.of(context).gapVertical,
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
                  child: AppAssets.images.googlePay.image(),
                ),
              ),
              title: const Text('Google Pay'),
            ),
            Dimens.of(context).gapVertical,
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
                  child: AppAssets.images.apple.image(),
                ),
              ),
              title: const Text('Apple Pay'),
            ),
            Dimens.of(context).gapVertical,
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
              selected: true,
              trailing: const Icon(Icons.check_outlined),
            ),
            Dimens.of(context).gapVertical,
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
                  child: AppAssets.images.visa.image(),
                ),
              ),
              title: const Text('.... .... .... .... 5567'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FilledButton(
          onPressed:
              () => Navigator.of(context).push(
                MaterialPage(
                  child: PayrollBalanceSummaryScreen(
                    viewModel: viewModel,
                    type: type,
                  ),
                ).createRoute(context),
              ),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

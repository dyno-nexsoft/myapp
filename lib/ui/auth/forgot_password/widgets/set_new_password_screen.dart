import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/error_indicator.dart';
import '../../widgets/auth_title.dart';
import '../view_models/forgot_password_viewmodel.dart';
import 'successful_screen.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key, required this.viewModel});

  final ForgotPasswordViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: Dimens.of(context).edgeInsetsHorizontal,
        children: [
          AuthTitle(
            title: AppLocalizations.of(context).secureYourAccount,
            subtitle: AppLocalizations.of(context).createNewPasswordInfo,
          ),
          Dimens.of(context).gapVertical,
          Text(
            AppLocalizations.of(context).newPassword,
            style: TextTheme.of(context).labelMedium,
          ),
          Dimens.of(context).gapVerticalSmall,
          TextFormField(
            obscureText: true,
            initialValue: 'password',
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).newPassword,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off),
              ),
            ),
          ),
          Dimens.of(context).gapVertical,
          Text(
            AppLocalizations.of(context).confirmNewPassword,
            style: TextTheme.of(context).labelMedium,
          ),
          Dimens.of(context).gapVerticalSmall,
          TextFormField(
            obscureText: true,
            initialValue: 'password',
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).confirmNewPassword,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ErrorIndicator.listener(
          command: viewModel.setNewPassword,
          title: AppLocalizations.of(context).errorWhileSaveNewPassword,
          listener: (context) {
            viewModel.setNewPassword.clearResult();
            Navigator.of(context).push(
              const MaterialPage(
                fullscreenDialog: true,
                child: SuccessfulScreen(),
              ).createRoute(context),
            );
          },
          builder: (context, child) {
            return FilledButton.icon(
              onPressed: () => viewModel.setNewPassword.execute('argument'),
              icon:
                  viewModel.setNewPassword.running
                      ? const SizedBox.square(
                        dimension: 24,
                        child: CircularProgressIndicator.adaptive(),
                      )
                      : null,
              label: Text(AppLocalizations.of(context).saveNewPassword),
            );
          },
        ),
      ),
    );
  }
}

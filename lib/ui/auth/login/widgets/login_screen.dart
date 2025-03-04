import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/adaptive_checkbox.dart';
import '../../../core/widgets/adaptive_dialog.dart';
import '../../welcome/widgets/social_buttons.dart';
import '../view_models/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: Dimens.of(context).edgeInsetsHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).welcomeBack,
              style: TextTheme.of(context).headlineLarge,
            ),
            Dimens.of(context).gapVertical,
            Text(
              AppLocalizations.of(context).hrTaskManagement,
              style: TextTheme.of(context).bodyLarge,
            ),
            const Spacer(),

            TextFormField(
              initialValue: 'hr.admin@google.com',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).email,
                prefixIcon: const Icon(Icons.mail),
              ),
            ),
            Dimens.of(context).gapVertical,
            TextFormField(
              initialValue: 'password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).password,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_off),
              ),
            ),
            Row(
              children: [
                AdaptiveCheckbox(value: false, onChanged: (_) {}),
                Text(AppLocalizations.of(context).rememberMe),
                const Spacer(),
                TextButton(
                  onPressed: () => const ForgotPasswordRoute().push(context),
                  child: Text(AppLocalizations.of(context).forgotPassword),
                ),
              ],
            ),
            const Spacer(),

            const SocialButtons(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListenableBuilder(
          listenable: viewModel.login,
          builder: (context, child) {
            if (viewModel.login.running) {
              SchedulerBinding.instance.addPostFrameCallback((_) async {
                await AdaptiveDialog(
                  title: const Center(
                    child: SizedBox.square(
                      dimension: 48,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  content: Text(
                    "${AppLocalizations.of(context).login}...",
                    textAlign: TextAlign.center,
                  ),
                ).show(context);
              });
            }
            return child!;
          },
          child: FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 42),
            ),
            onPressed: () => viewModel.login.execute(('email', 'password')),
            child: Text(AppLocalizations.of(context).login),
          ),
        ),
      ),
    );
  }
}

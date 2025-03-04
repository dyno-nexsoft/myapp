import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/adaptive_dialog.dart';
import '../../welcome/widgets/social_buttons.dart';
import '../view_models/sign_up_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.viewModel});

  final SignUpViewModel viewModel;

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
              AppLocalizations.of(context).createAccount,
              style: TextTheme.of(context).headlineLarge,
            ),
            Dimens.of(context).gapVertical,
            Text(
              AppLocalizations.of(context).elevateHrManagementWithDinosaur,
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
            const Spacer(),

            Center(
              child: Text.rich(
                TextSpan(
                  text: "Already have an acount? ",
                  children: [
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () => const LoginRoute().go(context),
                    ),
                  ],
                ),
                style: TextTheme.of(context).titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),

            Stack(
              alignment: Alignment.center,
              children: [
                const Divider(),
                Container(
                  padding: Dimens.of(context).edgeInsetsHorizontal,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(AppLocalizations.of(context).or),
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
          listenable: viewModel.signUp,
          builder: (context, child) {
            if (viewModel.signUp.running) {
              SchedulerBinding.instance.addPostFrameCallback((_) async {
                await AdaptiveDialog(
                  title: const Center(
                    child: SizedBox.square(
                      dimension: 48,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  content: Text(
                    '${AppLocalizations.of(context).signUp}...',
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
            onPressed: () => viewModel.signUp.execute(('email', 'password')),
            child: Text(AppLocalizations.of(context).signUp),
          ),
        ),
      ),
    );
  }
}

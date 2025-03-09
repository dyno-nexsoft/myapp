import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/error_indicator.dart';
import '../../widgets/auth_title.dart';
import '../../widgets/social_buttons.dart';
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
            AuthTitle(
              title: AppLocalizations.of(context).createAccount,
              subtitle:
                  AppLocalizations.of(context).elevateHrManagementWithDinosaur,
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
                        color: ColorScheme.of(context).secondary,
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
        child: ErrorIndicator.dialog(
          title: AppLocalizations.of(context).errorWhileSignUp,
          titleLoading: '${AppLocalizations.of(context).signUp}...',
          command: viewModel.signUp,
          child: FilledButton(
            onPressed: () => viewModel.signUp.execute(('email', 'password')),
            child: Text(AppLocalizations.of(context).signUp),
          ),
        ),
      ),
    );
  }
}

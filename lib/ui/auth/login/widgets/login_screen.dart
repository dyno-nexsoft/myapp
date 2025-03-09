import 'package:flutter/material.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/adaptive_checkbox.dart';
import '../../../core/widgets/error_indicator.dart';
import '../../widgets/auth_title.dart';
import '../../widgets/social_buttons.dart';
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
            AuthTitle(
              title: AppLocalizations.of(context).welcomeBack,
              subtitle: AppLocalizations.of(context).hrTaskManagement,
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
                  onPressed: () => const ForgotPasswordRoute().go(context),
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
        child: ErrorIndicator.dialog(
          title: AppLocalizations.of(context).errorWhileLogin,
          titleLoading: "${AppLocalizations.of(context).login}...",
          command: viewModel.login,
          child: FilledButton(
            onPressed: () => viewModel.login.execute(('email', 'password')),
            child: Text(AppLocalizations.of(context).login),
          ),
        ),
      ),
    );
  }
}

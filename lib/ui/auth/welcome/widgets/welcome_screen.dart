import 'package:flutter/material.dart';

import '../../../../config/assets.gen.dart';
import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../view_models/welcome_viewmodel.dart';
import 'social_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.viewModel});

  final WelcomeViewModel viewModel;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Dimens.of(context).edgeInsetsHorizontal,
        child: Column(
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.center,
              padding: Dimens.of(context).edgeInsetsAll,
              child: AppAssets.images.logoRemoveBg.image(height: 100),
            ),

            const Spacer(),
            Text(
              AppLocalizations.of(context).letsGetStarted,
              style: TextTheme.of(context).headlineLarge,
            ),
            Dimens.of(context).gapVertical,
            Text(
              AppLocalizations.of(context).accountDetails,
              style: TextTheme.of(context).titleMedium,
            ),

            const Spacer(),
            const SocialButtons(),

            const Spacer(),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 42),
              ),
              onPressed: () => const SignUpRoute().push(context),
              child:  Text(AppLocalizations.of(context).signUp),
            ),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 42),
              ),
              onPressed: () => const LoginRoute().push(context),
              child:  Text(AppLocalizations.of(context).login),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child:  Text(AppLocalizations.of(context).privacyPolicy),
                ),
                Dimens.of(context).gapHorizontal,
                TextButton(
                  onPressed: () {},
                  child:  Text(AppLocalizations.of(context).termsOfService),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

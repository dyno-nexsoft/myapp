import 'package:flutter/material.dart';

import '../../../../config/assets.gen.dart';
import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../widgets/auth_title.dart';
import '../../widgets/social_buttons.dart';
import '../view_models/welcome_viewmodel.dart';

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
            AuthTitle(
              title: AppLocalizations.of(context).letsGetStarted,
              subtitle: AppLocalizations.of(context).accountDetails,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),

            const Spacer(),
            const SocialButtons(),

            const Spacer(),
            FilledButton(
              onPressed: () => const SignUpRoute().go(context),
              child: Center(child: Text(AppLocalizations.of(context).signUp)),
            ),
            Dimens.of(context).gapVertical,
            FilledButton.tonal(
              onPressed: () => const LoginRoute().go(context),
              child: Center(child: Text(AppLocalizations.of(context).login)),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).privacyPolicy),
                ),
                Dimens.of(context).gapHorizontal,
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).termsOfService),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../widgets/auth_title.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Dimens.of(context).edgeInsetsAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.check_circle,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Dimens.of(context).gapVertical,
            AuthTitle(
              title: AppLocalizations.of(context).youreAllSet,
              subtitle:
                  AppLocalizations.of(context).passwordChangedSuccessfully,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Dimens.of(context).gapVertical,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FilledButton(
          onPressed: () {
            const HomeRoute().go(context);
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context).goToHomepage),
        ),
      ),
    );
  }
}

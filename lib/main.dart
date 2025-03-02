import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_development.dart' as development;
import 'routing/router.dart';
import 'ui/core/localization/app_localizations.dart';
import 'ui/core/themes/theme.dart';
import 'ui/core/view_models/app_viewmodel.dart';

/// Default main method
void main() {
  // Launch development config by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppViewModel(),
      child: Consumer<AppViewModel>(
        builder: (BuildContext context, AppViewModel value, Widget? child) {
          return MaterialApp.router(
            locale: value.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            themeMode: value.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: router(context.read()),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_development.dart' as development;
import 'routing/router.dart';
import 'ui/core/localization/app_localizations.dart';
import 'ui/core/themes/theme.dart';
import 'ui/core/ui/scroll_behavior.dart';

/// Default main method
void main() {
  // Launch development config by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: AppCustomScrollBehavior(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router(context.read()),
    );
  }
}

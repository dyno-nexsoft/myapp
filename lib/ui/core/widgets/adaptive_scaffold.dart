import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart' as sf;
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart'
    hide AdaptiveScaffold;
import 'package:go_router/go_router.dart';

import '../../core/localization/app_localizations.dart';
import '../themes/dimens.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({super.key, required this.body, this.secondaryBody});

  final Widget body;
  final Widget? secondaryBody;

  Page<T> buildPage<T>(BuildContext context) => switch (Dimens.of(context)) {
    DimensDesktop() => NoTransitionPage<T>(child: this),
    Dimens() => MaterialPage<T>(child: this),
  };

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: {
          Breakpoints.standard: SlotLayout.from(
            key: const Key('adaptive_scaffold.Breakpoints.standard'),
            builder: (_) => secondaryBody ?? body,
          ),
          Breakpoints.mediumLargeAndUp: SlotLayout.from(
            key: const Key('adaptive_scaffold.Breakpoints.mediumLargeAndUp'),
            builder: (_) => body,
          ),
        },
      ),
      secondaryBody: SlotLayout(
        config: {
          if (secondaryBody != null)
            Breakpoints.mediumLargeAndUp: SlotLayout.from(
              key: const Key('adaptive_scaffold.Breakpoints.mediumLargeAndUp'),
              builder: (_) => secondaryBody!,
            ),
        },
      ),
    );
  }
}

class AdaptiveScaffoldShell extends StatelessWidget {
  const AdaptiveScaffoldShell({
    super.key = const ValueKey('adaptive_scaffold.AdaptiveScaffold'),
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  /// https://github.com/flutter/flutter/issues/129850
  @override
  Widget build(BuildContext context) {
    return sf.AdaptiveScaffold(
      useDrawer: false,
      selectedIndex: navigationShell.currentIndex,
      onSelectedIndexChange: _onSelectedIndexChange,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context).home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.menu),
          label: AppLocalizations.of(context).settings,
        ),
      ],
      body: (context) => navigationShell,
    );
  }

  void _onSelectedIndexChange(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

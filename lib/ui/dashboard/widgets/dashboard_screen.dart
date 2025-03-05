import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/localization/app_localizations.dart';
import '../view_models/dashboard_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.navigationShell,
    required DashboardViewModel viewModel,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        shape: CircleBorder(),
        child: Icon(Icons.qr_code_scanner_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 64,
        notchMargin: 8,
        elevation: 10,
        padding: EdgeInsetsDirectional.zero,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context).profile,
            ),
          ],
        ),
      ),
    );
  }
}

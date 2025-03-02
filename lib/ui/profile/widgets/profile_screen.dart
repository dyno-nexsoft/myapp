import 'package:flutter/material.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/themes/dimens.dart';
import '../../core/view_models/app_viewmodel.dart';
import '../../core/widgets/adaptive_action_sheet.dart';
import '../../core/widgets/adaptive_switch.dart';
import '../view_models/profile_viewmodel.dart';
import 'profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.viewModel,
    required this.appViewModel,
  });

  final ProfileViewModel viewModel;
  final AppViewModel appViewModel;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return const [ProfileAppBar()];
      },
      body: ListView(
        clipBehavior: Clip.none,
        padding: Dimens.of(context).edgeInsetsAll,
        children: [
          Text('General', style: TextTheme.of(context).labelLarge),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Account Setting'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notification'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.face),
                  title: Text('Face Verification'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.pin),
                  title: Text('Set up your PIN'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap:
                      () => AdaptiveActionSheet(
                        title: const Text('Select Language'),
                        actions:
                            (context, rootNavigator) =>
                                AppLocalizations.supportedLocales.map((e) {
                                  return AdaptiveActionSheetAction(
                                    onPressed:
                                        () => appViewModel.changeLocale.execute(
                                          e,
                                        ),
                                    isDefaultAction: e == appViewModel.locale,
                                    child: Text(e.toString()),
                                  );
                                }).toList(),
                      ).show(context),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Dark Mode'),
                  trailing: ListenableBuilder(
                    listenable: appViewModel.changeThemeMode,
                    builder: (context, child) {
                      return AdaptiveSwitch(
                        value: appViewModel.themeMode == ThemeMode.dark,
                        onChanged:
                            (value) => appViewModel.changeThemeMode.execute(
                              value ? ThemeMode.dark : ThemeMode.light,
                            ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Dimens.of(context).gapVertical,
          Text('Company', style: TextTheme.of(context).labelLarge),
          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.work),
                  title: Text('My company'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.account_tree),
                  title: Text('Structure'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          Dimens.of(context).gapVertical,
          Text('About', style: TextTheme.of(context).labelLarge),
          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About us'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text('FAQ'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

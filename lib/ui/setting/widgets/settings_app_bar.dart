import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../config/assets.gen.dart';
import '../../auth/logout/view_models/logout_viewmodel.dart';
import '../../auth/logout/widgets/logout_button.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/themes/dimens.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({
    super.key,
    this.expandedHeight = 200,
    this.collapsedHeight = 64,
  });

  final double expandedHeight;
  final double collapsedHeight;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return SliverAppBar.large(
      elevation: 0,
      forceMaterialTransparency: true,
      systemOverlayStyle: switch (Theme.of(context).brightness) {
        Brightness.dark => SystemUiOverlayStyle.dark,
        Brightness.light => SystemUiOverlayStyle.light,
      },
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight + topPadding,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(AppLocalizations.of(context).profile),
      actions: [
        LogoutButton(
          color: Theme.of(context).colorScheme.onPrimary,
          viewModel: LogoutViewModel(authRepository: context.read()),
        ),
        Dimens.of(context).gapHorizontal,
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight - topPadding - collapsedHeight;

          return Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: Dimens.of(context).borderRadiusBottom,
                ),
              ),
              Opacity(
                opacity: height / (expandedHeight - collapsedHeight),
                child: OverflowBox(
                  maxHeight: double.infinity,
                  child: Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Padding(
                            padding: Dimens.of(context).edgeInsetsAll / 3,
                            child: CircleAvatar(
                              radius: Dimens.of(context).profilePictureSize / 2,
                              backgroundImage: AppAssets.images.user.provider(),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              shape: BoxShape.circle,
                            ),
                            padding: Dimens.of(context).edgeInsetsAll / 4,
                            child: Icon(
                              Icons.camera,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Mike Cooper',
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        'Marketing Officer • DE3824+MO4',
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        'At Tricks. since 2021',
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      Dimens.of(context).gapVertical,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

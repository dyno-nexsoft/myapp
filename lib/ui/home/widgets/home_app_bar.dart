import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.expandedHeight = 280,
    this.collapsedHeight = 64,
    this.breakPoint = 80,
  });

  final double collapsedHeight;
  final double expandedHeight;
  final double breakPoint;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      elevation: 0,
      forceMaterialTransparency: true,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight + MediaQuery.paddingOf(context).top,
      systemOverlayStyle: switch (Theme.of(context).brightness) {
        Brightness.dark => SystemUiOverlayStyle.dark,
        Brightness.light => SystemUiOverlayStyle.light,
      },
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                height: constraints.maxHeight.clamp(
                  0,
                  expandedHeight - breakPoint,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: Dimens.of(context).borderRadius.copyWith(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: AnimatedOpacity(
                  opacity:
                      constraints.maxHeight >= (expandedHeight - breakPoint)
                          ? 1.0
                          : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    elevation: 2,
                    margin: Dimens.of(context).edgeInsetsHorizontal,
                    shape: RoundedRectangleBorder(
                      borderRadius: Dimens.of(context).borderRadius,
                    ),
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text("Today's Overview"),
                          subtitle: Text('24 September 2023'),
                          trailing: Icon(Icons.more_horiz),
                        ),
                        Container(
                          margin: Dimens.of(context).edgeInsetsHorizontal,
                          padding: Dimens.of(context).edgeInsetsAllSmall,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(25),
                            borderRadius: Dimens.of(context).borderRadius,
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Clock In',
                                      style: TextTheme.of(context).bodyLarge,
                                    ),
                                    Text(
                                      '08.00 AM',
                                      style: TextTheme.of(context).titleLarge,
                                    ),
                                    Container(
                                      margin:
                                          Dimens.of(
                                            context,
                                          ).edgeInsetsVertical /
                                          2,
                                      padding:
                                          Dimens.of(context).edgeInsetsAllSmall,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),

                                      child: Text(
                                        'Done at 07.58 AM',
                                        style: TextTheme.of(context).labelSmall
                                            ?.copyWith(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(),
                                Column(
                                  children: [
                                    Text(
                                      'Clock Out',
                                      style: TextTheme.of(context).bodyLarge,
                                    ),
                                    Text(
                                      '05.00 PM',
                                      style: TextTheme.of(context).titleLarge,
                                    ),
                                    Container(
                                      margin:
                                          Dimens.of(
                                            context,
                                          ).edgeInsetsVertical /
                                          2,
                                      padding:
                                          Dimens.of(context).edgeInsetsAllSmall,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 100,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Not yet',
                                        style: TextTheme.of(context).labelSmall
                                            ?.copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Dimens.of(context).gapVertical,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.viewPaddingOf(context).top,
                right: MediaQuery.viewPaddingOf(context).right,
                left: 0,
                child: ListTile(
                  dense: true,
                  contentPadding: Dimens.of(context).edgeInsetsHorizontal,
                  leading: CircleAvatar(
                    backgroundImage: AppAssets.images.user.provider(),
                  ),
                  title: const Text('Marketing Orientation'),
                  titleTextStyle: TextTheme.of(context).bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  subtitle: const Text('Mike Cooper'),
                  subtitleTextStyle: TextTheme.of(
                    context,
                  ).titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () => const NotificationRoute().go(context),
          icon: Badge.count(
            count: 10,
            child: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

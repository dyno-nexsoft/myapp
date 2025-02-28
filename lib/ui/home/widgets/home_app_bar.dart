import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../config/assets.gen.dart';
import '../../auth/logout/view_models/logout_viewmodel.dart';
import '../../auth/logout/widgets/logout_button.dart';
import '../../core/themes/dimens.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.toolbarHeight = kToolbarHeight,
    this.expandedHeight = 260,
  });

  final double toolbarHeight;
  final double expandedHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      elevation: 0,
      forceMaterialTransparency: true,
      toolbarHeight: toolbarHeight,
      expandedHeight: expandedHeight,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                height: constraints.maxHeight.clamp(0, expandedHeight - 50),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
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
                      constraints.maxHeight >= (expandedHeight - 50)
                          ? 1.0
                          : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text("Today's Overview"),
                          subtitle: Text('24 September 2023'),
                          trailing: Icon(Icons.more_horiz),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'clock In',
                                    style: TextTheme.of(context).bodyLarge,
                                  ),
                                  Text(
                                    '08.00 AM',
                                    style: TextTheme.of(context).titleLarge,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
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
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    constraints: BoxConstraints(minWidth: 100),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: CircleAvatar(
                    backgroundImage: AppAssets.images.user.provider(),
                  ),
                  title: const Text('Marketing Orientation'),
                  titleTextStyle: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(color: Colors.white),
                  subtitle: const Text('Mike Cooper'),
                  subtitleTextStyle: TextTheme.of(
                    context,
                  ).titleMedium?.copyWith(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        LogoutButton(
          color: Colors.white,
          viewModel: LogoutViewModel(authRepository: context.read()),
        ),
        Dimens.of(context).gapHorizontal,
      ],
    );
  }
}

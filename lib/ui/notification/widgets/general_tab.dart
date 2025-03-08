import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      data: ListTileTheme.of(context).copyWith(
        titleAlignment: ListTileTitleAlignment.top,
        titleTextStyle: TextTheme.of(context).titleMedium,
        subtitleTextStyle: TextTheme.of(context).bodyMedium,
        horizontalTitleGap: Dimens.of(context).padding,
      ),
      child: ListView.builder(
        padding: Dimens.of(context).edgeInsetsVertical,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 2) {
      return ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: Text(
          'Yesterday',
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
        title: const Divider(),
      );
    }
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).disabledColor),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(12.0),
          child: switch (index % 5) {
            1 => const Icon(Icons.info_rounded),
            2 => const Icon(Icons.lock_rounded),
            3 => const Icon(Icons.star_rounded),
            4 => const Icon(Icons.calendar_month_rounded),
            int() => const Icon(Icons.verified_user),
          },
        ),
      ),
      title: switch (index % 5) {
        1 => const Text('System Update Available'),
        2 => const Text('Password Reset Successful'),
        3 => const Text('Exciting New Feature'),
        4 => const Text('Event Reminder'),
        int() => const Text('Account Security Alert'),
      },
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "We've noticed some unusual activity"
            'on your account. Please review your'
            'recent logins and update your'
            'password if necessary.',
          ),
          Dimens.of(context).gapVerticalSmall,
          Text('08:46 AM', style: TextTheme.of(context).bodySmall),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index < 2) ...[
            Icon(
              Icons.circle,
              size: 12,
              color: Theme.of(context).colorScheme.primary,
            ),
            Dimens.of(context).gapHorizontalSmall,
          ],
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

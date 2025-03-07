import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';

class LeaveTab extends StatelessWidget {
  const LeaveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      data: ListTileTheme.of(context).copyWith(
        dense: true,
        titleTextStyle: TextTheme.of(context).titleMedium,
        subtitleTextStyle: TextTheme.of(context).bodyMedium,
      ),
      child: ListView.builder(
        padding: Dimens.of(context).edgeInsetsAll,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimens.of(context).paddingSmall,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AppAssets.images.user.provider(),
          ),
          title: const Text('Henry Adams'),
          subtitle: const Text('Accountant'),
          trailing:
              index.isEven
                  ? FilledButton(
                    style: FilledButton.styleFrom(minimumSize: Size.zero),
                    onPressed: () {},
                    child: const Text('Approve'),
                  )
                  : OutlinedButton(
                    style: OutlinedButton.styleFrom(minimumSize: Size.zero),
                    onPressed: () {},
                    child: const Text('Approved'),
                  ),
        ),
        Text('Notes:', style: TextTheme.of(context).titleMedium),
        Text(
          'Hello, 11m not feeling well and need to request 2 days'
          'of sick leave. live included my doctors note for your'
          'review. Thank you for your understanding.:',
          style: TextTheme.of(context).bodyMedium,
        ),
        Text('Attachment:', style: TextTheme.of(context).titleMedium),
        const Card(
          borderOnForeground: false,
          child: ListTile(
            leading: Icon(Icons.description),
            title: Text('Sick Leave Document.pdf'),
            trailing: Icon(Icons.download_rounded),
          ),
        ),
      ],
    );
  }
}

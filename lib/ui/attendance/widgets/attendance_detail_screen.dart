import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/attendance_viewmodel.dart';

class AttendanceDetailScreen extends StatelessWidget {
  const AttendanceDetailScreen({
    super.key,
    required this.viewModel,
    required this.id,
  });

  final AttendanceViewModel viewModel;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Dimens.of(context).automaticallyImplyLeading,
        title: Text(id),
      ),
      body: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          contentPadding: Dimens.of(context).edgeInsetsHorizontal,
          titleTextStyle: TextTheme.of(context).titleMedium,
          subtitleTextStyle: TextTheme.of(context).bodySmall,
        ),
        child: ListView.builder(itemBuilder: _itemBuilder),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AppAssets.images.user.provider(),
      ),
      title: const Text('William Brown'),
      subtitle: const Text('Product Engineer'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/notification_viewmodel.dart';
import 'general_tab.dart';
import 'leave_tab.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, required this.viewModel});

  final NotificationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
          bottom: TabBar(
            padding: Dimens.of(context).edgeInsetsHorizontal,
            tabs: const <Widget>[
              Tab(text: 'General'),
              Tab(text: 'Leave'),
              Tab(text: 'Overtime'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[GeneralTab(), LeaveTab(), LeaveTab()],
        ),
      ),
    );
  }
}

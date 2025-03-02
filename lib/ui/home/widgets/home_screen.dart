import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../view_models/home_viewmodel.dart';
import 'home_app_bar.dart';
import 'home_menu.dart';

const String bookingButtonKey = 'booking-button';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: Dimens.of(context).edgeInsetsVertical,
          sliver: const HomeMenu(),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ],
    );
  }
}

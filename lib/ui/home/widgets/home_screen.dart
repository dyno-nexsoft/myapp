import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';
import 'home_app_bar.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverList.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        ],
      ),
    );
  }
}

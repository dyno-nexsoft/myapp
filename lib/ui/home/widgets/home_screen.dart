import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/logout/view_models/logout_viewmodel.dart';
import '../../auth/logout/widgets/logout_button.dart';
import '../../core/themes/dimens.dart';
import '../view_models/home_viewmodel.dart';

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
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          LogoutButton(
            viewModel: LogoutViewModel(authRepository: context.read()),
          ),
          Dimens.of(context).gapHorizontal,
        ],
      ),
    );
  }
}

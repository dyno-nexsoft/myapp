import 'package:flutter/material.dart';

import '../../../../config/colors.gen.dart';
import '../../../core/localization/app_localizations.dart';
import '../view_models/logout_viewmodel.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key, required this.viewModel, this.color});

  final Color? color;
  final LogoutViewModel viewModel;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LogoutButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.logout.removeListener(_onResult);
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.logout.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyEE),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
        ),
        child: InkResponse(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            widget.viewModel.logout.execute();
          },
          child: Center(
            child: Icon(
              size: 24.0,
              Icons.logout,
              color: widget.color ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  void _onResult() {
    // We do not need to navigate to `/login` on logout,
    // it is done automatically by GoRouter.

    if (widget.viewModel.logout.error) {
      widget.viewModel.logout.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).errorWhileLogout),
          action: SnackBarAction(
            label: AppLocalizations.of(context).tryAgain,
            onPressed: widget.viewModel.logout.execute,
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../../core/widgets/error_indicator.dart';
import '../view_models/logout_viewmodel.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.viewModel, this.color});

  final Color? color;
  final LogoutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ErrorIndicator.dialog(
      command: viewModel.logout,
      title: AppLocalizations.of(context).errorWhileLogout,
      onPressed: viewModel.logout.execute,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: Dimens.of(context).edgeInsetsAllSmall,
          shape: RoundedRectangleBorder(
            borderRadius: Dimens.of(context).borderRadiusSmall,
            side: BorderSide(color: color ?? ColorScheme.of(context).onSurface),
          ),
        ),
        onPressed: viewModel.logout.execute,
        icon: Icon(Icons.logout, color: color),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../widgets/auth_title.dart';
import '../view_models/forgot_password_viewmodel.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, required this.viewModel});

  final ForgotPasswordViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Dimens.of(context).edgeInsetsHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTitle(
              title: AppLocalizations.of(context).resetYourPassword,
              subtitle: AppLocalizations.of(context).enterEmailForPasswordReset,
            ),
            Dimens.of(context).gapVerticalLarge,
            Text(
              AppLocalizations.of(context).email,
              style: TextTheme.of(context).bodySmall,
            ),
            Dimens.of(context).gapVerticalSmall,
            TextFormField(
              initialValue: 'hr.admn@google.com',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).email,
                prefixIcon: const Icon(Icons.mail),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FilledButton(
          onPressed:
              () => const OtpRoute().push<String>(context).then((otp) {
                if (otp != null && context.mounted) {
                  const SetNewPasswordRoute().push(context);
                }
              }),
          child: Text(AppLocalizations.of(context).sendOtpCode),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/dimens.dart';
import '../../widgets/auth_title.dart';
import '../view_models/otp_viewmodel.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.viewModel});

  final OtpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Dimens.of(context).edgeInsetsHorizontal,
        child: Column(
          children: [
            AuthTitle(
              title: AppLocalizations.of(context).enterOtpCode,
              subtitle: AppLocalizations.of(context).checkEmailForOtp,
            ),
            Dimens.of(context).gapVerticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return TextField(
                  maxLength: 1,
                  showCursor: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextTheme.of(context).titleLarge,
                  decoration: InputDecoration(
                    counterText: '',
                    constraints: BoxConstraints.tight(const Size.square(64)),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index != 3) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index != 0) {
                      FocusScope.of(context).previousFocus();
                    } else {
                      Navigator.of(context).pop('1234');
                    }
                  },
                );
              }),
            ),
            Dimens.of(context).gapVerticalLarge,
            Text.rich(
              TextSpan(
                text: AppLocalizations.of(context).resendCodeInSeconds,
                children: [
                  TextSpan(
                    text: ' 56 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(text: AppLocalizations.of(context).seconds),
                ],
              ),
              style: TextTheme.of(context).bodyLarge,
            ),
            Dimens.of(context).gapVerticalSmall,
            TextButton(
              onPressed: null,
              child: Text(AppLocalizations.of(context).resendCode),
            ),
          ],
        ),
      ),
    );
  }
}

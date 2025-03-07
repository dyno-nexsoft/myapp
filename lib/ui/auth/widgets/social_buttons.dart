import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimens.of(context).padding,
      children: [
        _buildSocialButton(
          context,
          logo: AppAssets.images.google.image(),
          title: 'Continue with Google',
        ),
        _buildSocialButton(
          context,
          logo: AppAssets.images.apple.image(),
          title: 'Continue with Apple',
        ),
        _buildSocialButton(
          context,
          logo: AppAssets.images.facebook.image(),
          title: 'Continue with Facebook',
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required Widget logo,
    required String title,
  }) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: SizedBox.square(dimension: 24, child: logo),
      label: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextTheme.of(context).titleMedium,
        ),
      ),
    );
  }
}

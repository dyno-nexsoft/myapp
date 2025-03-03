import 'package:flutter/material.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/colors.gen.dart';
import '../../../core/themes/dimens.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSocialButton(
          context,
          logo: AppAssets.images.google.image(),
          title: 'Continue with Google',
        ),
        const SizedBox(height: 8),
        _buildSocialButton(
          context,
          logo: AppAssets.images.apple.image(),
          title: 'Continue with Apple',
        ),
        const SizedBox(height: 8),
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
    return Container(
      padding: Dimens.of(context).edgeInsetsAll / 2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.shade100),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox.square(dimension: 24, child: logo),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextTheme.of(context).titleMedium,
            ),
          ),
          const SizedBox.square(dimension: 24),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../view_models/welcome_viewmodel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.viewModel});

  final WelcomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Text("Let's Get Started!"),
          Text("Let's dive in into your account"),
          Text('Continue with Google'),
          Text('Continue with Apple'),
          Text('Continue with Facebook'),
          Text('Sign up'),
          Text('Log in'),
          Text('Privacy Policy'),
          Text('Terms of Service'),
        ],
      ),
    );
  }
}

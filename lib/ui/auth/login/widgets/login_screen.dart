// Suggested code may be subject to a license. Learn more: ~LicenseLog:741897899.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2402485050.
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/app_localizations.dart';
import '../view_models/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'email@example.com',
  );
  final TextEditingController _password = TextEditingController(
    text: 'password',
  );

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult);
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context).welcome,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).email,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).password,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                widget.viewModel.login.running
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed:
                          () => widget.viewModel.login.execute((
                            _email.value.text,
                            _password.value.text,
                          )),
                      child: Text(AppLocalizations.of(context).login),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.login.completed) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        widget.viewModel.login.clearResult();
        const HomeRoute().go(context);
      });
    }

    if (widget.viewModel.login.error) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        widget.viewModel.login.clearResult();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).errorWhileLogin),
            action: SnackBarAction(
              label: AppLocalizations.of(context).tryAgain,
              onPressed:
                  () => widget.viewModel.login.execute((
                    _email.value.text,
                    _password.value.text,
                  )),
            ),
          ),
        );
      });
    }
  }
}

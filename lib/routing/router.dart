import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import 'routes.dart';

GoRouter? _router;

/// Top go_router entry point.
///
/// Listens to changes in [AuthTokenRepository] to redirect the user
/// to /login when the user logs out.
GoRouter router(AuthRepository authRepository) =>
    _router ??= GoRouter(
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: $appRoutes,
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  if ([
    const ForgotPasswordRoute().location,
    const OtpRoute().location,
    const SetNewPasswordRoute().location,
  ].contains(state.matchedLocation)) {
    return null;
  }

  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = <String>[
    const WelcomeRoute().location,
    const LoginRoute().location,
    const SignUpRoute().location,
  ].contains(state.matchedLocation);
  if (!loggedIn && !loggingIn) {
    return const LoginRoute().location;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggedIn && loggingIn) {
    return const HomeRoute().location;
  }

  // no need to redirect at all
  return null;
}

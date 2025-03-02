import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/dashboard/view_models/dashboard_viewmodel.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/profile/view_models/profile_viewmodel.dart';
import '../ui/profile/widgets/profile_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute({this.from});
  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(
      viewModel: LoginViewModel(authRepository: context.read()),
    );
  }
}

@TypedStatefulShellRoute<DashboardRoute>(
  branches: [
    TypedStatefulShellBranch<FirstBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<SecondBranch>(
      routes: [TypedGoRoute<ProfileRoute>(path: '/profile')],
    ),
  ],
)
class DashboardRoute extends StatefulShellRouteData {
  const DashboardRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    final viewModel = DashboardViewModel();
    return DashboardScreen(
      viewModel: viewModel,
      navigationShell: navigationShell,
    );
  }
}

class FirstBranch extends StatefulShellBranchData {}

class SecondBranch extends StatefulShellBranchData {}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = HomeViewModel();
    return HomeScreen(viewModel: viewModel);
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = ProfileViewModel(userRepository: context.read());
    return ProfileScreen(viewModel: viewModel, appViewModel: context.read());
  }
}

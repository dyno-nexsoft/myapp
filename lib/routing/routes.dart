import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/auth/welcome/view_models/welcome_viewmodel.dart';
import '../ui/auth/welcome/widgets/welcome_screen.dart';
import '../ui/dashboard/view_models/dashboard_viewmodel.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/setting/view_models/settings_viewmodel.dart';
import '../ui/setting/widgets/settings_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<WelcomeRoute>(
  path: '/',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LoginRoute>(
      path: 'login',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ForgotPasswordRoute>(path: 'forgot-password'),
      ],
    ),
    TypedGoRoute<SignUpRoute>(path: 'signup'),
  ],
)
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = WelcomeViewModel();
    return WelcomeScreen(viewModel: viewModel);
  }
}

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

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

@TypedStatefulShellRoute<DashboardRoute>(
  branches: [
    TypedStatefulShellBranch<FirstBranch>(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: '/home',
          routes: [
            TypedGoRoute<NotificationRoute>(path: 'notification'),
            TypedGoRoute<AttendanceRoute>(path: 'attendance'),
            TypedGoRoute<PayrollRoute>(
              path: 'payroll',
              routes: [
                TypedGoRoute<PayrollDetailsRoute>(path: 'details'),
                TypedGoRoute<PayrollHistoryRoute>(
                  path: 'history',
                  routes: [
                    TypedGoRoute<PayrollHistoryDetailRoute>(path: 'details'),
                  ],
                ),
                TypedGoRoute<PayrollBalanceRoute>(path: 'balance'),
                TypedGoRoute<PayrollBalanceHistoryRoute>(
                  path: 'balance-history',
                  routes: [
                    TypedGoRoute<PayrollBalanceHistoryDetailsRoute>(
                      path: 'details',
                    ),
                  ],
                ),
              ],
            ),
            TypedGoRoute<EmployeesRoute>(
              path: 'employees',
              routes: [
                TypedGoRoute<NewDepartmentRoute>(path: 'new-department'),
                TypedGoRoute<NewEmployeeRoute>(path: 'new-employee'),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SecondBranch>(
      routes: [
        TypedGoRoute<SettingsRoute>(
          path: '/setting',
          routes: [
            TypedGoRoute<UpgradePlanRoute>(path: 'upgrade-plan'),
            TypedGoRoute<CompanyProfileRoute>(path: 'company-profile'),
            TypedGoRoute<WorkPatternRoute>(path: 'work-pattern'),
            TypedGoRoute<WorkdayScheduleRoute>(path: 'workday-schedule'),
            TypedGoRoute<ManageSalaryRatesRoute>(path: 'manage-salary-rates'),
            TypedGoRoute<ManageTaxRatesRoute>(path: 'manage-tax-rates'),
            TypedGoRoute<ManageDocumentsRoute>(path: 'manage-documents'),
            TypedGoRoute<ManageAdminRoute>(path: 'manage-admin'),
            TypedGoRoute<AppAppearanceRoute>(path: 'app-appearance'),
            TypedGoRoute<HelpAndSupportRoute>(path: 'help-and-support'),
          ],
        ),
      ],
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

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = SettingsViewModel(userRepository: context.read());
    return SettingsScreen(viewModel: viewModel, appViewModel: context.read());
  }
}

class NotificationRoute extends GoRouteData {
  const NotificationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class AttendanceRoute extends GoRouteData {
  const AttendanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollRoute extends GoRouteData {
  const PayrollRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollDetailsRoute extends GoRouteData {
  const PayrollDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollHistoryRoute extends GoRouteData {
  const PayrollHistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollHistoryDetailRoute extends GoRouteData {
  const PayrollHistoryDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollBalanceRoute extends GoRouteData {
  const PayrollBalanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollBalanceHistoryRoute extends GoRouteData {
  const PayrollBalanceHistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class PayrollBalanceHistoryDetailsRoute extends GoRouteData {
  const PayrollBalanceHistoryDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class EmployeesRoute extends GoRouteData {
  const EmployeesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class NewDepartmentRoute extends GoRouteData {
  const NewDepartmentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class NewEmployeeRoute extends GoRouteData {
  const NewEmployeeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class UpgradePlanRoute extends GoRouteData {
  const UpgradePlanRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class CompanyProfileRoute extends GoRouteData {
  const CompanyProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class WorkPatternRoute extends GoRouteData {
  const WorkPatternRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class WorkdayScheduleRoute extends GoRouteData {
  const WorkdayScheduleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class ManageSalaryRatesRoute extends GoRouteData {
  const ManageSalaryRatesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class ManageTaxRatesRoute extends GoRouteData {
  const ManageTaxRatesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class ManageDocumentsRoute extends GoRouteData {
  const ManageDocumentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class ManageAdminRoute extends GoRouteData {
  const ManageAdminRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class AppAppearanceRoute extends GoRouteData {
  const AppAppearanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

class HelpAndSupportRoute extends GoRouteData {
  const HelpAndSupportRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

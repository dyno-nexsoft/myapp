import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/attendance/view_models/attendance_viewmodel.dart';
import '../ui/attendance/widgets/attendance_detail_screen.dart';
import '../ui/attendance/widgets/attendance_screen.dart';
import '../ui/auth/forgot_password/view_models/forgot_password_viewmodel.dart';
import '../ui/auth/forgot_password/widgets/forgot_password_screen.dart';
import '../ui/auth/forgot_password/widgets/set_new_password_screen.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/auth/otp/view_models/otp_viewmodel.dart';
import '../ui/auth/otp/widgets/otp_screen.dart';
import '../ui/auth/sign_up/view_models/sign_up_viewmodel.dart';
import '../ui/auth/sign_up/widgets/sign_up_screen.dart';
import '../ui/auth/welcome/view_models/welcome_viewmodel.dart';
import '../ui/auth/welcome/widgets/welcome_screen.dart';
import '../ui/core/widgets/adaptive_scaffold.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/notification/view_models/notification_viewmodel.dart';
import '../ui/notification/widgets/notification_screen.dart';
import '../ui/payroll/view_models/payroll_viewmodel.dart';
import '../ui/payroll/widgets/payroll_balance_history_screen.dart';
import '../ui/payroll/widgets/payroll_balance_screen.dart';
import '../ui/payroll/widgets/payroll_details_global_screen.dart';
import '../ui/payroll/widgets/payroll_details_screen.dart';
import '../ui/payroll/widgets/payroll_history_detail_screen.dart';
import '../ui/payroll/widgets/payroll_history_screen.dart';
import '../ui/payroll/widgets/payroll_screen.dart';
import '../ui/setting/view_models/settings_viewmodel.dart';
import '../ui/setting/widgets/settings_screen.dart';

part 'routes.g.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

@TypedGoRoute<WelcomeRoute>(
  path: '/',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LoginRoute>(path: 'login'),
    TypedGoRoute<SignUpRoute>(path: 'signup'),
  ],
)
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  static final $parentNavigatorKey = rootNavigationKey;

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
    final viewModel = LoginViewModel(authRepository: context.read());
    return LoginScreen(viewModel: viewModel);
  }
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = SignUpViewModel(authRepository: context.read());
    return SignUpScreen(viewModel: viewModel);
  }
}

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgot-password',
  routes: [
    TypedGoRoute<OtpRoute>(path: 'otp'),
    TypedGoRoute<SetNewPasswordRoute>(path: 'set-new-password'),
  ],
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  static final $parentNavigatorKey = rootNavigationKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = ForgotPasswordViewModel(authRepository: context.read());
    return ForgotPasswordScreen(viewModel: viewModel);
  }
}

class OtpRoute extends GoRouteData {
  const OtpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = OtpViewModel();
    return OtpScreen(viewModel: viewModel);
  }
}

class SetNewPasswordRoute extends GoRouteData {
  const SetNewPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = ForgotPasswordViewModel(authRepository: context.read());
    return SetNewPasswordScreen(viewModel: viewModel);
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
            TypedGoRoute<AttendanceRoute>(
              path: 'attendance',
              routes: [
                TypedGoRoute<AttendanceDetailRoute>(path: 'details/:id'),
              ],
            ),
            TypedGoRoute<PayrollRoute>(
              path: 'payroll',
              routes: [
                TypedGoRoute<PayrollDetailsGlobalRoute>(path: 'details/global'),
                TypedGoRoute<PayrollDetailsRoute>(path: 'details/:id'),
                TypedGoRoute<PayrollHistoryRoute>(
                  path: 'history',
                  routes: [
                    TypedGoRoute<PayrollHistoryDetailRoute>(
                      path: 'details/:id',
                    ),
                  ],
                ),
                TypedGoRoute<PayrollBalanceRoute>(path: 'balance/:type'),
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

  static final $parentNavigatorKey = rootNavigationKey;

  @override
  Widget builder(context, state, navigationShell) {
    return AdaptiveScaffoldShell(navigationShell: navigationShell);
  }
}

class FirstBranch extends StatefulShellBranchData {}

class SecondBranch extends StatefulShellBranchData {}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = HomeViewModel();
    return AdaptiveScaffold(
      body: HomeScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = SettingsViewModel(userRepository: context.read());
    return AdaptiveScaffold(
      body: SettingsScreen(viewModel: viewModel, appViewModel: context.read()),
    ).buildPage(context, state);
  }
}

class NotificationRoute extends GoRouteData {
  const NotificationRoute();

  static final $parentNavigatorKey = rootNavigationKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final viewModel = NotificationViewModel();
    return NotificationScreen(viewModel: viewModel);
  }
}

class AttendanceRoute extends GoRouteData {
  const AttendanceRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = AttendanceViewModel();
    return AdaptiveScaffold(
      body: AttendanceScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class AttendanceDetailRoute extends GoRouteData {
  const AttendanceDetailRoute({required this.id, this.$extra});

  final String id;
  final AttendanceViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? AttendanceViewModel();
    return AdaptiveScaffold(
      body: AttendanceScreen(viewModel: viewModel),
      secondaryBody: AttendanceDetailScreen(viewModel: viewModel, id: id),
    ).buildPage(context, state);
  }
}

class PayrollRoute extends GoRouteData {
  const PayrollRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class PayrollDetailsGlobalRoute extends GoRouteData {
  const PayrollDetailsGlobalRoute({this.$extra});

  final PayrollViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollScreen(viewModel: viewModel),
      secondaryBody: PayrollDetailsGlobalScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class PayrollDetailsRoute extends GoRouteData {
  const PayrollDetailsRoute({required this.id, this.$extra});

  final String id;
  final PayrollViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollScreen(viewModel: viewModel),
      secondaryBody: PayrollDetailsScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class PayrollHistoryRoute extends GoRouteData {
  const PayrollHistoryRoute();

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollHistoryScreen(viewModel: viewModel),
    ).buildPage(context, state);
  }
}

class PayrollHistoryDetailRoute extends GoRouteData {
  const PayrollHistoryDetailRoute({required this.id, this.$extra});

  final String id;
  final PayrollViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollHistoryScreen(viewModel: viewModel),
      secondaryBody: PayrollHistoryDetailScreen(viewModel: viewModel, id: id),
    ).buildPage(context, state);
  }
}

class PayrollBalanceRoute extends GoRouteData {
  const PayrollBalanceRoute({required this.type, this.$extra});

  final String type;
  final PayrollViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollScreen(viewModel: viewModel),
      secondaryBody: PayrollBalanceScreen(viewModel: viewModel, type: type),
    ).buildPage(context, state);
  }
}

class PayrollBalanceHistoryRoute extends GoRouteData {
  const PayrollBalanceHistoryRoute({this.$extra});

  final PayrollViewModel? $extra;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final viewModel = $extra ?? PayrollViewModel();
    return AdaptiveScaffold(
      body: PayrollScreen(viewModel: viewModel),
      secondaryBody: PayrollBalanceHistoryScreen(viewModel: viewModel),
    ).buildPage(context, state);
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

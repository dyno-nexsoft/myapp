// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $welcomeRoute,
  $forgotPasswordRoute,
  $dashboardRoute,
];

RouteBase get $welcomeRoute => GoRouteData.$route(
  path: '/',

  parentNavigatorKey: WelcomeRoute.$parentNavigatorKey,

  factory: $WelcomeRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: 'login', factory: $LoginRouteExtension._fromState),
    GoRouteData.$route(
      path: 'signup',

      factory: $SignUpRouteExtension._fromState,
    ),
  ],
);

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => const WelcomeRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) =>
      LoginRoute(from: state.uri.queryParameters['from']);

  String get location => GoRouteData.$location(
    '/login',
    queryParams: {if (from != null) 'from': from},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  String get location => GoRouteData.$location('/signup');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
  path: '/forgot-password',

  parentNavigatorKey: ForgotPasswordRoute.$parentNavigatorKey,

  factory: $ForgotPasswordRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: 'otp', factory: $OtpRouteExtension._fromState),
    GoRouteData.$route(
      path: 'set-new-password',

      factory: $SetNewPasswordRouteExtension._fromState,
    ),
  ],
);

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  String get location => GoRouteData.$location('/forgot-password');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OtpRouteExtension on OtpRoute {
  static OtpRoute _fromState(GoRouterState state) => const OtpRoute();

  String get location => GoRouteData.$location('/forgot-password/otp');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SetNewPasswordRouteExtension on SetNewPasswordRoute {
  static SetNewPasswordRoute _fromState(GoRouterState state) =>
      const SetNewPasswordRoute();

  String get location =>
      GoRouteData.$location('/forgot-password/set-new-password');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardRoute => StatefulShellRouteData.$route(
  parentNavigatorKey: DashboardRoute.$parentNavigatorKey,
  factory: $DashboardRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: $HomeRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'notification',

              parentNavigatorKey: NotificationRoute.$parentNavigatorKey,

              factory: $NotificationRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'attendance',

              factory: $AttendanceRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'details/:id',

                  factory: $AttendanceDetailRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'payroll',

              factory: $PayrollRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'details/global',

                  factory: $PayrollDetailsGlobalRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'details/:id',

                  factory: $PayrollDetailsRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'history',

                  factory: $PayrollHistoryRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'details/:id',

                      factory: $PayrollHistoryDetailRouteExtension._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'balance/:type',

                  factory: $PayrollBalanceRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'balance-history',

                  factory: $PayrollBalanceHistoryRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'details',

                      factory:
                          $PayrollBalanceHistoryDetailsRouteExtension
                              ._fromState,
                    ),
                  ],
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'employees',

              factory: $EmployeesRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'new-department',

                  factory: $NewDepartmentRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'new-employee',

                  factory: $NewEmployeeRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/setting',

          factory: $SettingsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'upgrade-plan',

              factory: $UpgradePlanRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'company-profile',

              factory: $CompanyProfileRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'work-pattern',

              factory: $WorkPatternRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'workday-schedule',

              factory: $WorkdayScheduleRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'manage-salary-rates',

              factory: $ManageSalaryRatesRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'manage-tax-rates',

              factory: $ManageTaxRatesRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'manage-documents',

              factory: $ManageDocumentsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'manage-admin',

              factory: $ManageAdminRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'app-appearance',

              factory: $AppAppearanceRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'help-and-support',

              factory: $HelpAndSupportRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationRouteExtension on NotificationRoute {
  static NotificationRoute _fromState(GoRouterState state) =>
      const NotificationRoute();

  String get location => GoRouteData.$location('/home/notification');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AttendanceRouteExtension on AttendanceRoute {
  static AttendanceRoute _fromState(GoRouterState state) =>
      const AttendanceRoute();

  String get location => GoRouteData.$location('/home/attendance');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AttendanceDetailRouteExtension on AttendanceDetailRoute {
  static AttendanceDetailRoute _fromState(GoRouterState state) =>
      AttendanceDetailRoute(
        id: state.pathParameters['id']!,
        $extra: state.extra as AttendanceViewModel?,
      );

  String get location => GoRouteData.$location(
    '/home/attendance/details/${Uri.encodeComponent(id)}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollRouteExtension on PayrollRoute {
  static PayrollRoute _fromState(GoRouterState state) => const PayrollRoute();

  String get location => GoRouteData.$location('/home/payroll');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PayrollDetailsGlobalRouteExtension on PayrollDetailsGlobalRoute {
  static PayrollDetailsGlobalRoute _fromState(GoRouterState state) =>
      PayrollDetailsGlobalRoute($extra: state.extra as PayrollViewModel?);

  String get location => GoRouteData.$location('/home/payroll/details/global');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollDetailsRouteExtension on PayrollDetailsRoute {
  static PayrollDetailsRoute _fromState(GoRouterState state) =>
      PayrollDetailsRoute(
        id: state.pathParameters['id']!,
        $extra: state.extra as PayrollViewModel?,
      );

  String get location =>
      GoRouteData.$location('/home/payroll/details/${Uri.encodeComponent(id)}');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollHistoryRouteExtension on PayrollHistoryRoute {
  static PayrollHistoryRoute _fromState(GoRouterState state) =>
      const PayrollHistoryRoute();

  String get location => GoRouteData.$location('/home/payroll/history');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PayrollHistoryDetailRouteExtension on PayrollHistoryDetailRoute {
  static PayrollHistoryDetailRoute _fromState(GoRouterState state) =>
      PayrollHistoryDetailRoute(
        id: state.pathParameters['id']!,
        $extra: state.extra as PayrollViewModel?,
      );

  String get location => GoRouteData.$location(
    '/home/payroll/history/details/${Uri.encodeComponent(id)}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollBalanceRouteExtension on PayrollBalanceRoute {
  static PayrollBalanceRoute _fromState(GoRouterState state) =>
      PayrollBalanceRoute(
        type: state.pathParameters['type']!,
        $extra: state.extra as PayrollViewModel?,
      );

  String get location => GoRouteData.$location(
    '/home/payroll/balance/${Uri.encodeComponent(type)}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollBalanceHistoryRouteExtension on PayrollBalanceHistoryRoute {
  static PayrollBalanceHistoryRoute _fromState(GoRouterState state) =>
      PayrollBalanceHistoryRoute($extra: state.extra as PayrollViewModel?);

  String get location => GoRouteData.$location('/home/payroll/balance-history');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PayrollBalanceHistoryDetailsRouteExtension
    on PayrollBalanceHistoryDetailsRoute {
  static PayrollBalanceHistoryDetailsRoute _fromState(GoRouterState state) =>
      const PayrollBalanceHistoryDetailsRoute();

  String get location =>
      GoRouteData.$location('/home/payroll/balance-history/details');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EmployeesRouteExtension on EmployeesRoute {
  static EmployeesRoute _fromState(GoRouterState state) =>
      const EmployeesRoute();

  String get location => GoRouteData.$location('/home/employees');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewDepartmentRouteExtension on NewDepartmentRoute {
  static NewDepartmentRoute _fromState(GoRouterState state) =>
      const NewDepartmentRoute();

  String get location =>
      GoRouteData.$location('/home/employees/new-department');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewEmployeeRouteExtension on NewEmployeeRoute {
  static NewEmployeeRoute _fromState(GoRouterState state) =>
      const NewEmployeeRoute();

  String get location => GoRouteData.$location('/home/employees/new-employee');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location('/setting');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpgradePlanRouteExtension on UpgradePlanRoute {
  static UpgradePlanRoute _fromState(GoRouterState state) =>
      const UpgradePlanRoute();

  String get location => GoRouteData.$location('/setting/upgrade-plan');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CompanyProfileRouteExtension on CompanyProfileRoute {
  static CompanyProfileRoute _fromState(GoRouterState state) =>
      const CompanyProfileRoute();

  String get location => GoRouteData.$location('/setting/company-profile');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WorkPatternRouteExtension on WorkPatternRoute {
  static WorkPatternRoute _fromState(GoRouterState state) =>
      const WorkPatternRoute();

  String get location => GoRouteData.$location('/setting/work-pattern');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WorkdayScheduleRouteExtension on WorkdayScheduleRoute {
  static WorkdayScheduleRoute _fromState(GoRouterState state) =>
      const WorkdayScheduleRoute();

  String get location => GoRouteData.$location('/setting/workday-schedule');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ManageSalaryRatesRouteExtension on ManageSalaryRatesRoute {
  static ManageSalaryRatesRoute _fromState(GoRouterState state) =>
      const ManageSalaryRatesRoute();

  String get location => GoRouteData.$location('/setting/manage-salary-rates');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ManageTaxRatesRouteExtension on ManageTaxRatesRoute {
  static ManageTaxRatesRoute _fromState(GoRouterState state) =>
      const ManageTaxRatesRoute();

  String get location => GoRouteData.$location('/setting/manage-tax-rates');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ManageDocumentsRouteExtension on ManageDocumentsRoute {
  static ManageDocumentsRoute _fromState(GoRouterState state) =>
      const ManageDocumentsRoute();

  String get location => GoRouteData.$location('/setting/manage-documents');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ManageAdminRouteExtension on ManageAdminRoute {
  static ManageAdminRoute _fromState(GoRouterState state) =>
      const ManageAdminRoute();

  String get location => GoRouteData.$location('/setting/manage-admin');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppAppearanceRouteExtension on AppAppearanceRoute {
  static AppAppearanceRoute _fromState(GoRouterState state) =>
      const AppAppearanceRoute();

  String get location => GoRouteData.$location('/setting/app-appearance');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelpAndSupportRouteExtension on HelpAndSupportRoute {
  static HelpAndSupportRoute _fromState(GoRouterState state) =>
      const HelpAndSupportRoute();

  String get location => GoRouteData.$location('/setting/help-and-support');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

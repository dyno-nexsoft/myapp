import 'package:flutter/material.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: Dimens.of(context).homeMenuCount,
      children: [
        HomeMenuItem(
          icon: Icons.schedule_outlined,
          color: Colors.red,
          text: 'Attendance',
          onPressed: () => const AttendanceRoute().go(context),
        ),
        HomeMenuItem(
          icon: Icons.paid_outlined,
          color: Colors.teal,
          text: 'Payroll',
          onPressed: () => const PayrollRoute().go(context),
        ),
        HomeMenuItem(
          icon: Icons.groups,
          color: Colors.orange,
          text: 'Employees',
          onPressed: () => const EmployeesRoute().go(context),
        ),
        const HomeMenuItem(
          icon: Icons.pending_actions_outlined,
          color: Colors.brown,
          text: 'Time Off',
        ),
        const HomeMenuItem(
          icon: Icons.calendar_month_outlined,
          color: Colors.purple,
          text: 'Calendar',
        ),
        const HomeMenuItem(
          icon: Icons.alarm_outlined,
          color: Colors.blue,
          text: 'Overtime',
        ),
        const HomeMenuItem(
          icon: Icons.power_settings_new_outlined,
          color: Colors.red,
          text: 'Resign',
        ),
        const HomeMenuItem(icon: Icons.more_horiz, text: 'Other'),
      ],
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({
    super.key,
    this.icon,
    this.color,
    this.text,
    this.onPressed,
  });

  final IconData? icon;
  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(
            minimumSize: const Size.square(50),
            padding: EdgeInsetsDirectional.zero,
            shape: RoundedRectangleBorder(
              borderRadius: Dimens.of(context).borderRadius,
            ),
            backgroundColor: Theme.of(context).hoverColor,
          ),
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color?.withAlpha(onPressed == null ? 100 : 255),
          ),
        ),
        Dimens.of(context).gapVerticalSmall,
        Text(text ?? '', style: TextTheme.of(context).labelSmall),
      ],
    );
  }
}

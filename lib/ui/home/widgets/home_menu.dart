import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 4,
      children: [
        HomeMenuItem(
          icon: Icons.receipt_outlined,
          color: Colors.teal.shade400,
          text: 'Payroll',
        ),
        HomeMenuItem(
          icon: Icons.payments_outlined,
          color: Colors.red.shade400,
          text: 'Payslip',
        ),
        HomeMenuItem(
          icon: Icons.forum_outlined,
          color: Colors.orange.shade400,
          text: 'Counseling',
        ),
        HomeMenuItem(
          icon: Icons.pending_actions_outlined,
          color: Colors.brown.shade400,
          text: 'Time Off',
        ),
        HomeMenuItem(
          icon: Icons.calendar_month_outlined,
          color: Colors.purple.shade400,
          text: 'Calendar',
        ),
        HomeMenuItem(
          icon: Icons.alarm_outlined,
          color: Colors.blue.shade400,
          text: 'Overtime',
        ),
        HomeMenuItem(
          icon: Icons.power_settings_new_outlined,
          color: Colors.red.shade400,
          text: 'Resign',
        ),
        const HomeMenuItem(icon: Icons.more_horiz, text: 'Other'),
      ],
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({super.key, this.icon, this.color, this.text});

  final IconData? icon;
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
            borderRadius: Dimens.of(context).borderRadiusAll,
          ),
          child: Icon(icon, color: color),
        ),
        Dimens.of(context).gapVertical,
        Text(text ?? 'Item', style: TextTheme.of(context).labelSmall),
      ],
    );
  }
}

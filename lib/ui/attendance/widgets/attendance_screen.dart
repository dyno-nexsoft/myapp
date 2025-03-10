import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../view_models/attendance_viewmodel.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key, required this.viewModel});

  final AttendanceViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: ListView(
        padding: Dimens.of(context).edgeInsetsAll,
        children: [
          GridView.extent(
            mainAxisSpacing: Dimens.of(context).paddingSmall,
            crossAxisSpacing: Dimens.of(context).paddingSmall,
            maxCrossAxisExtent: 300,
            childAspectRatio: 5 / 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildCard(
                context,
                label: 'Not Clock in yet',
                length: 5,
                color: Colors.orange,
              ),
              _buildCard(
                context,
                label: 'Clock In',
                length: 7,
                color: Colors.blue,
              ),
              _buildCard(
                context,
                label: 'Leave',
                length: 3,
                color: Colors.indigo,
              ),
              _buildCard(
                context,
                label: 'Break',
                length: 2,
                color: Colors.green,
              ),
              _buildCard(
                context,
                label: 'After Break',
                length: 2,
                color: Colors.yellow,
              ),
              _buildCard(
                context,
                label: 'Clock Out',
                length: 1,
                color: Colors.purple,
              ),
              _buildCard(
                context,
                label: 'Overtime In',
                length: 3,
                color: Colors.cyan,
              ),
              _buildCard(
                context,
                label: 'Overtime Out',
                length: 0,
                color: Colors.brown,
              ),
            ],
          ),
          Dimens.of(context).gapVerticalLarge,
          GridView.extent(
            mainAxisSpacing: Dimens.of(context).paddingSmall,
            crossAxisSpacing: Dimens.of(context).paddingSmall,
            maxCrossAxisExtent: 300,
            childAspectRatio: 5 / 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildChart(
                context,
                icon: Icons.person_add_outlined,
                title: 'Employees Attendance',
                body: 'Increased vs last month',
              ),
              _buildChart(
                context,
                icon: Icons.person_remove_alt_1_outlined,
                title: 'Late Employees',
                body: 'Decreased vs last month',
              ),
              _buildChart(
                context,
                icon: Icons.description_outlined,
                title: 'Employees on Leave',
                body: 'Decreased vs last month',
              ),
              _buildChart(
                context,
                icon: Icons.schedule_outlined,
                title: 'Overtime Employees',
                body: 'Increased vs last month',
              ),
            ],
          ),
          Dimens.of(context).gapVerticalLarge,
          Card(
            child: Padding(
              padding: Dimens.of(context).edgeInsetsAll,
              child: Column(
                spacing: Dimens.of(context).padding,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Working Hours',
                          style: TextTheme.of(
                            context,
                          ).titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: 'This Week',
                            items:
                                ['This Week', 'This Month', 'This Year']
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {},
                            isDense: true,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            borderRadius: Dimens.of(context).borderRadius,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: TextTheme.of(context).titleSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 0),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(28 * 10 + 56),
                    child: BarChart(barChartData(context)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String label,
    required int length,
    required Color color,
  }) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimens.of(context).paddingSmall,
        ),
        isThreeLine: true,
        onTap:
            () =>
                AttendanceDetailRoute(id: label, $extra: viewModel).go(context),
        titleTextStyle: TextTheme.of(context).titleMedium,
        title: Text('$label ($length)', maxLines: 1),
        subtitle: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: List.generate(
            length,
            (index) => CircleAvatar(
              radius: 16,
              backgroundImage: AppAssets.images.user.provider(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Card(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimens.of(context).paddingSmall,
        ),
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).dividerColor.withAlpha(50),
            ),
          ),
          child: Icon(icon, size: 18),
        ),
        title: Column(
          spacing: Dimens.of(context).paddingSmall,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: LineChart(lineChartData)),
                  Dimens.of(context).gapHorizontalSmall,
                  Text(
                    '12.8%',
                    style: TextTheme.of(
                      context,
                    ).labelSmall?.copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextTheme.of(context).titleSmall,
            ),
            Text(
              body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextTheme.of(context).bodySmall,
            ),
            Dimens.of(context).gapVerticalSmall,
          ],
        ),
      ),
    );
  }

  LineChartData get lineChartData => LineChartData(
    gridData: const FlGridData(show: false),
    titlesData: const FlTitlesData(show: false),
    lineTouchData: const LineTouchData(enabled: false),
    borderData: FlBorderData(show: false),
    lineBarsData: [
      LineChartBarData(
        dotData: const FlDotData(show: false),
        spots: const [
          FlSpot(0, 4.5),
          FlSpot(2, 5),
          FlSpot(4, 5),
          FlSpot(6, 4.75),
          FlSpot(8, 5),
          FlSpot(10, 5.25),
        ],
        isCurved: true,
        color: Colors.green,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              Colors.green.withValues(alpha: 0.5),
              Colors.green.withValues(alpha: 0),
            ],
            stops: const [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ],
  );

  BarChartData barChartData(BuildContext context) => BarChartData(
    minY: 30,
    maxY: 40,
    rotationQuarterTurns: 1,
    gridData: const FlGridData(show: false),
    borderData: FlBorderData(show: false),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        axisNameSize: 28,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 28,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              meta: meta,
              child: CircleAvatar(
                radius: 14,
                backgroundImage: AppAssets.images.user.provider(),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        axisNameSize: 28,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 28,
          interval: 2,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(meta: meta, child: Text('${value ~/ 1}h'));
          },
        ),
      ),
      topTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
    ),
    barGroups: List.generate(
      10,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: Random().nextDouble() * 10 + 30,
            color: ColorScheme.of(context).primary,
          ),
        ],
      ),
    ),
  );
}

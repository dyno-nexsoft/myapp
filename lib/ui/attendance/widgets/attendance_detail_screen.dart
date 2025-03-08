import 'package:flutter/material.dart';

import '../view_models/attendance_viewmodel.dart';

class AttendanceDetailScreen extends StatelessWidget {
  const AttendanceDetailScreen({super.key, required this.viewModel});

  final AttendanceViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Detail')),
      body: const Center(child: Text('Attendance Detail Screen')),
    );
  }
}

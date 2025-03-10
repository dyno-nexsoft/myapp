import 'dart:collection';

import 'package:flutter/widgets.dart';

class EmployeesViewModel extends ChangeNotifier {
  final List<String> _employees = [];

  List<String> get employees => UnmodifiableListView(_employees);

  void addEmployee(String employee) {
    _employees.add(employee);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../models/subject.dart';

class GradeTrackerProvider extends ChangeNotifier {
  final List<Subject> _subjects = <Subject>[];
  bool _isDarkMode = false;
  int _selectedIndex = 0;

  List<Subject> get subjects => List<Subject>.unmodifiable(_subjects);

  List<Subject> get passingSubjects {
    return _subjects.where((subject) => subject.isPassing).toList();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) {
      return 0;
    }

    final total = _subjects
        .map((subject) => subject.mark)
        .fold<int>(0, (sum, mark) => sum + mark);
    return total / _subjects.length;
  }

  String get overallGrade {
    final average = averageMark;

    if (_subjects.isEmpty) {
      return '-';
    }
    if (average >= 80) {
      return 'A';
    }
    if (average >= 65) {
      return 'B';
    }
    if (average >= 50) {
      return 'C';
    }
    return 'F';
  }

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  int get selectedIndex => _selectedIndex;

  void addSubject({required String name, required int mark}) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void removeSubjectAt(int index) {
    if (index < 0 || index >= _subjects.length) {
      return;
    }

    _subjects.removeAt(index);
    notifyListeners();
  }

  void selectScreen(int index) {
    if (_selectedIndex == index) {
      return;
    }

    _selectedIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

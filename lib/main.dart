import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/grade_tracker_provider.dart';
import 'screens/home_shell.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const StudentGradeTrackerApp());
}

class StudentGradeTrackerApp extends StatelessWidget {
  const StudentGradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GradeTrackerProvider(),
      child: Consumer<GradeTrackerProvider>(
        builder: (context, tracker, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Student Grade Tracker',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: tracker.themeMode,
            home: child,
          );
        },
        child: const HomeShell(),
      ),
    );
  }
}

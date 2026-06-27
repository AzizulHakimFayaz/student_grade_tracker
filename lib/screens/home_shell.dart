import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_subject_form_provider.dart';
import '../providers/grade_tracker_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  static const List<String> _titles = <String>[
    'Add Subject',
    'Subject List',
    'Summary',
  ];

  @override
  Widget build(BuildContext context) {
    final tracker = context.watch<GradeTrackerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[tracker.selectedIndex]),
        actions: <Widget>[
          IconButton(
            tooltip: tracker.isDarkMode ? 'Use light theme' : 'Use dark theme',
            onPressed: context.read<GradeTrackerProvider>().toggleTheme,
            icon: Icon(
              tracker.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: tracker.selectedIndex,
        children: <Widget>[
          ChangeNotifierProvider<AddSubjectFormProvider>(
            create: (_) => AddSubjectFormProvider(),
            child: AddSubjectScreen(),
          ),
          const SubjectListScreen(),
          const SummaryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tracker.selectedIndex,
        onTap: context.read<GradeTrackerProvider>().selectScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt),
            label: 'Subjects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}

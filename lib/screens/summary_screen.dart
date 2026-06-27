import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grade_tracker_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/summary_stat_tile.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tracker = context.watch<GradeTrackerProvider>();

    if (tracker.totalSubjects == 0) {
      return const EmptyState(
        icon: Icons.insights_outlined,
        title: 'No summary available',
        message: 'Add subjects to calculate your average and overall grade.',
      );
    }

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          SummaryStatTile(
            icon: Icons.menu_book_outlined,
            label: 'Total Subjects',
            value: tracker.totalSubjects.toString(),
          ),
          const SizedBox(height: 12),
          SummaryStatTile(
            icon: Icons.calculate_outlined,
            label: 'Average Mark',
            value: tracker.averageMark.toStringAsFixed(1),
          ),
          const SizedBox(height: 12),
          SummaryStatTile(
            icon: Icons.workspace_premium_outlined,
            label: 'Overall Grade',
            value: tracker.overallGrade,
          ),
          const SizedBox(height: 12),
          SummaryStatTile(
            icon: Icons.verified_outlined,
            label: 'Passing Subjects',
            value: tracker.passingSubjects.length.toString(),
          ),
        ],
      ),
    );
  }
}

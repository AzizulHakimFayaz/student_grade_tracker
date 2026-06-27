import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grade_tracker_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/subject_tile.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = context.watch<GradeTrackerProvider>().subjects;

    if (subjects.isEmpty) {
      return const EmptyState(
        icon: Icons.playlist_add_outlined,
        title: 'No subjects yet',
        message: 'Add your first subject to see marks and grades here.',
      );
    }

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Dismissible(
              key: ValueKey<String>('${subject.name}-${subject.mark}-$index'),
              direction: DismissDirection.endToStart,
              background: _DeleteBackground(),
              onDismissed: (_) {
                context.read<GradeTrackerProvider>().removeSubjectAt(index);
              },
              child: SubjectTile(subject: subject),
            ),
          );
        },
      ),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.delete_outline,
            color: colorScheme.onErrorContainer,
          ),
        ),
      ),
    );
  }
}

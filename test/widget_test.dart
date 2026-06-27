import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_grade_tracker/main.dart';
import 'package:student_grade_tracker/models/subject.dart';
import 'package:student_grade_tracker/providers/grade_tracker_provider.dart';

void main() {
  group('Subject', () {
    test('returns the correct grade for mark ranges', () {
      expect(Subject(name: 'Bangla', mark: 80).grade, 'A');
      expect(Subject(name: 'English', mark: 65).grade, 'B');
      expect(Subject(name: 'Math', mark: 50).grade, 'C');
      expect(Subject(name: 'Science', mark: 49).grade, 'F');
    });
  });

  group('GradeTrackerProvider', () {
    test('updates summary values when subjects change', () {
      final tracker = GradeTrackerProvider()
        ..addSubject(name: 'Math', mark: 90)
        ..addSubject(name: 'English', mark: 70)
        ..addSubject(name: 'Science', mark: 40);

      expect(tracker.totalSubjects, 3);
      expect(tracker.averageMark, closeTo(66.67, 0.01));
      expect(tracker.overallGrade, 'B');
      expect(tracker.passingSubjects.length, 2);

      tracker.removeSubjectAt(2);

      expect(tracker.totalSubjects, 2);
      expect(tracker.averageMark, 80);
      expect(tracker.overallGrade, 'A');
    });
  });

  testWidgets('validates, adds, summarizes, and deletes a subject', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentGradeTrackerApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'Add Subject'));
    await tester.pump();

    expect(find.text('Enter a subject name'), findsOneWidget);
    expect(find.text('Enter a valid mark'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Mathematics');
    await tester.enterText(find.byType(TextFormField).at(1), '86');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add Subject'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Subjects'));
    await tester.pumpAndSettle();

    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('Mark: 86'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);

    await tester.tap(find.text('Summary'));
    await tester.pumpAndSettle();

    expect(find.text('Total Subjects'), findsOneWidget);
    expect(find.text('Average Mark'), findsOneWidget);
    expect(find.text('Overall Grade'), findsOneWidget);
    expect(find.text('86.0'), findsOneWidget);

    await tester.tap(find.text('Subjects'));
    await tester.pumpAndSettle();
    await tester.drag(
      find.byKey(const ValueKey<String>('Mathematics-86-0')),
      const Offset(-600, 0),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mathematics'), findsNothing);

    await tester.tap(find.text('Summary'));
    await tester.pumpAndSettle();

    expect(find.text('No summary available'), findsOneWidget);
  });
}

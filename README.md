# Student Grade Tracker

A Flutter app for students to record subjects, marks, grades, and an automatically updating result summary.

## Features

- Add subjects with validated name and mark fields.
- View all subjects in a swipe-to-delete list.
- See grade results using A, B, C, and F grade ranges.
- View live summary values for total subjects, average mark, overall grade, and passing subjects.
- Switch between custom light and dark themes from the app bar.
- Provider-based app state for subjects, navigation, theme mode, and form controllers.
- Reusable widgets for text fields, buttons, empty states, subject rows, and summary tiles.

## Grade Rules

- A: 80-100
- B: 65-79
- C: 50-64
- F: 0-49

## Run Locally

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
flutter analyze
```

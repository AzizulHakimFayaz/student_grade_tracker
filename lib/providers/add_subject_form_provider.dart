import 'package:flutter/material.dart';

class AddSubjectFormProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController markController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter a subject name';
    }
    return null;
  }

  String? validateMark(String? value) {
    final mark = int.tryParse(value?.trim() ?? '');

    if (mark == null) {
      return 'Enter a valid mark';
    }
    if (mark < 0 || mark > 100) {
      return 'Mark must be between 0 and 100';
    }
    return null;
  }

  String get subjectName => nameController.text.trim();

  int get subjectMark => int.parse(markController.text.trim());

  void clear() {
    nameController.clear();
    markController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    markController.dispose();
    super.dispose();
  }
}

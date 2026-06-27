import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_subject_form_provider.dart';
import '../providers/grade_tracker_provider.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_action_button.dart';

class AddSubjectScreen extends StatelessWidget {
  AddSubjectScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final form = context.watch<AddSubjectFormProvider>();
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Text(
            'Enter a subject and mark to calculate its grade.',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppTextField(
                  controller: form.nameController,
                  labelText: 'Subject name',
                  hintText: 'Example: Mathematics',
                  prefixIcon: Icons.menu_book_outlined,
                  textInputAction: TextInputAction.next,
                  validator: form.validateName,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: form.markController,
                  labelText: 'Mark',
                  hintText: '0 - 100',
                  prefixIcon: Icons.percent_outlined,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: form.validateMark,
                ),
                const SizedBox(height: 24),
                PrimaryActionButton(
                  icon: Icons.save_outlined,
                  label: 'Add Subject',
                  onPressed: () => _submit(context, form),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context, AddSubjectFormProvider form) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<GradeTrackerProvider>().addSubject(
      name: form.subjectName,
      mark: form.subjectMark,
    );
    form.clear();
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Subject added')));
  }
}

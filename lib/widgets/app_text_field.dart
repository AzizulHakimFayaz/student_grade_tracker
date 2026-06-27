import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.keyboardType,
    this.textInputAction,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}

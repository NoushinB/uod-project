import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final IconData? icon;
  final bool obscureText;

  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.initialValue,
    this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        suffixIcon: Icon(icon),
      ),
      validator: validator,
      initialValue: initialValue,
    );
  }
}

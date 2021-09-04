import 'package:flutter/material.dart';

class Textformfieldcomponent extends StatelessWidget {
  late final String hint;
  final String? Function(String?)? validator;
  final bool? obsecure;
  final Widget? icons;
  final Widget? suffix;
  late final TextEditingController controller;

  Textformfieldcomponent({
    Key? key,
    required this.hint,
    required this.controller,
    this.icons,
    this.obsecure,
    this.validator,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: icons,
        suffixIcon: suffix,
      ),
    );
  }
}

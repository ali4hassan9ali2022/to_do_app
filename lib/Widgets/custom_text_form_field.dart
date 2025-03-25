import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    required this.onTap,
    required this.type,
  });
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Function() onTap;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: type,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}
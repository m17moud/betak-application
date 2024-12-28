import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.controller,
      required this.validator,
      required this.icon});

  final String? Function(String?)? validator;
  final String hint;
  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF5D5D60),
          ),
          filled: true,
          fillColor: const Color(0xFFE0E3E8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(fontSize: 14)),
      style: const TextStyle(color: Colors.black),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

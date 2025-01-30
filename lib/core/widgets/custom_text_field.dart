import 'package:betak/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.controller,
      this.maxLines = 1,
      required this.validator,
       this.icon});

  final String? Function(String?)? validator;
  final String hint;
  final TextEditingController? controller;
  final IconData? icon;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          hintText: hint,
          hintStyle: const TextStyle(
            color: ColorManager.textFormHintColor,
          ),
          filled: true,
          fillColor: ColorManager.textFormFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(fontSize: 14)),
      style: const TextStyle(color: ColorManager.black),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

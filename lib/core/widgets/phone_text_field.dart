import '../utils/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.screenWidth,
    this.controller,
    required this.validator,
    required this.icon,
  });

  final String? Function(String?)? validator;
  final double screenWidth;
  final TextEditingController? controller;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(15), // Limit phone number length
      ],
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText:
            AppStrings.enterYourPhone.tr(), // Hint for the phone number field
        hintStyle: const TextStyle(
          color: Color(0xFF5D5D60),
        ),
        filled: true,
        fillColor: const Color(0xFFE0E3E8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(fontSize: 14),
      ),
      style: const TextStyle(color: Colors.black),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

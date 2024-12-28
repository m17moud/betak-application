import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.screenWidth,
      required this.checkVisibility,
      required this.hint,
      required this.borderRadius,
      this.hintColor,
      this.controller,
      required this.validator});

  final String? Function(String?)? validator;
  final double screenWidth;
  final double borderRadius;
  final bool checkVisibility;
  final String hint;
  final Color? hintColor;
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText: widget.hint,
        hintStyle:
            TextStyle(color: widget.hintColor ?? const Color(0xFF5D5D60)),
        filled: true,
        fillColor: const Color(0xFFE0E3E8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleVisibility,
        ),
        errorStyle: const TextStyle(fontSize: 14),
      ),
      style: const TextStyle(color: Colors.black),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

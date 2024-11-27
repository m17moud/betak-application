import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.screenWidth, required this.checkVisibility,required this.hint, required this.borderRadius, this.hintColor});

  final double screenWidth;
  final double borderRadius;
  final bool checkVisibility;
  final String hint;
  final Color? hintColor;

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
    var screenWidth = widget.screenWidth;

    return Center(
      child: Container(
        height: 65,
        width: screenWidth * .9,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E3E8),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: TextField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(color: widget.hintColor ?? Colors.black),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: _toggleVisibility,
                  ),
               
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

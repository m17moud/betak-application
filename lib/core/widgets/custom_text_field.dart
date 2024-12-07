import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.screenWidth,
    required this.hint,
     this.controller
  });

  final double screenWidth;
  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: screenWidth * 9,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E3E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF5D5D60),

            ),
          ),
          style: const TextStyle(color: Colors.black),
          controller: controller,

        ),
      ),);
  }
}

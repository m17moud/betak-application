import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth * .75,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child:  Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            border: InputBorder.none,
            hintText: 'البحث عن المنتج او الفئه او العلامه التجاريه',
            hintStyle: Styles.styleRegularInter16.copyWith(color: const Color(0xFF455A64),fontWeight: FontWeight.w500),
            suffixIcon: const Icon(
              Icons.search,
              color: Color(0xFF455A64),
              size: 30,
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

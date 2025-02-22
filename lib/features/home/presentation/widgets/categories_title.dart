import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: width * 0.03, top: height * 0.01),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'الفئات',
          style: Styles.styleBoldIrinaSans48.copyWith(
            fontSize: width *
                0.065, 
            color: const Color(0xFF455A64),
          ),
        ),
      ),
    );
  }
}

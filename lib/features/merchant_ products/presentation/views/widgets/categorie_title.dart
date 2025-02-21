import '../../../../../core/utils/styles.dart';

import 'package:flutter/material.dart';

class CategorieTitle extends StatelessWidget {
  const CategorieTitle({
    super.key,
    required this.width,
    required this.height,
    required this.departmentName,
  });

  final double width;
  final double height;
  final String departmentName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(right: width * 0.03, top: height * 0.01),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          departmentName,
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betak/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomTitleText({
    super.key,
    required this.text,
    this.style = Styles.styleSemiBoldInter20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 5,top: 10),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: style,
          )),
    );
  }
}

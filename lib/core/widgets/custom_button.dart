import 'package:betak/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {super.key,
        required this.backgroundColor,
        this.borderRadius,

        required this.text, this.fontSize, this.buttonWidth, this.buttonHeight, required this.onPressed,  this.textStyle, this.textColor});

  final Color backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;

  final double? buttonWidth;
  final double? buttonHeight;

  final VoidCallback onPressed; // Callback function for onPressed event

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: textStyle ?? TextStyle(fontFamily: kInterLight,fontWeight: FontWeight.w300,color: textColor ?? const Color(0xffF3F3F3) ,fontSize:fontSize ?? 22),
          )),
    );
  }
}




class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
        required this.backgroundColor,
        this.borderRadius,

        required this.text, this.fontSize, this.buttonWidth, this.buttonHeight, required this.onPressed,  this.textStyle});

  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;

  final double? buttonWidth;
  final double? buttonHeight;

  final VoidCallback onPressed; // Callback function for onPressed event

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: textStyle ?? Styles.styleBoldIrinaSans20,
          )),
    );
  }
}
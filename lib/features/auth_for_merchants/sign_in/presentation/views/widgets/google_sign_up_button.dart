import 'package:betak/core/utils/styles.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    super.key, this.onPressed, required this.height,
  });
  final void Function()? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 368,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(Assets.imagesGoogleIcon,width: 30,height:30),
        label: Text(
          '\t\t\t\t\tاشترك عبر حساب جوجل',
          style: Styles.styleRegularInter16.copyWith(color: const Color(0xFF5D5E61)),

        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFCCCCCC)), // Border color
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/styles.dart';

class FacebookSignUpButton extends StatelessWidget {
  const FacebookSignUpButton({
    super.key, this.onPressed, required this.icon, required this.text, required this.color, required this.height,
  });
  final void Function()? onPressed;
  final SvgPicture icon;
  final String text;
  final Color color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 368,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
      ),
      child: ElevatedButton.icon(

        onPressed: onPressed,
        icon: icon,
        label: Text(
          '\t\t\t\t$text',
          style: Styles.styleRegularInter16.copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Styles.blueSky,
          textStyle: Styles.styleRegularInter16.copyWith(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

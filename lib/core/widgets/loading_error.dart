import '../utils/color_manager.dart';
import '../utils/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LoadingError({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double textSize = constraints.maxWidth < 400 ? 14.0 : 16.0;
        double buttonFontSize = constraints.maxWidth < 400 ? 15.0 : 17.0;
        double buttonPadding = constraints.maxWidth < 400 ? 16.0 : 20.0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text.tr(),
              style: TextStyle(
                  fontSize: textSize,
                  color: ColorManager.error,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.lightGrey,
                padding: EdgeInsets.symmetric(horizontal: buttonPadding, vertical: 12.0),
              ),
              child: Text(
                AppStrings.tryAgain.tr(),
                style: TextStyle(fontSize: buttonFontSize, color: ColorManager.error),
              ),
            ),
          ],
        );
      },
    );
  }
}

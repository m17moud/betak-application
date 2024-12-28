import '../utils/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/string_manager.dart';
import '../utils/styles.dart';

class LoginErrorDialog extends StatelessWidget {
  final String message;

  const LoginErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppStrings.error.tr(),
        style: const TextStyle(color: ColorManager.error),
      ),
      contentTextStyle:
          const TextStyle(fontSize: 18, color: Styles.flyByNight),
      content: Text(message.tr()),
      actions: <Widget>[
        TextButton(
          child: Text(
            AppStrings.ok.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

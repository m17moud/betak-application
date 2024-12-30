import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/color_manager.dart';
import '../utils/routes_manager.dart';
import '../utils/string_manager.dart';
import '../utils/styles.dart';

class SuccessSignupDialog extends StatelessWidget {
  const SuccessSignupDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppStrings.successSignup.tr(),
        style: const TextStyle(color: ColorManager.green),
      ),
      contentTextStyle: const TextStyle(fontSize: 18, color: Styles.flyByNight),
      content: Text(AppStrings.verifyEmailMessage.tr()),
      actions: <Widget>[
        TextButton(
          child: Text(
            AppStrings.ok.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.clientSignInRoute);
          },
        ),
      ],
    );
  }
}

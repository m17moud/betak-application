
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../utils/color_manager.dart';
import '../utils/string_manager.dart';

class SuccessDialog {
  static void show({
    required BuildContext context,
    required String message,
    required VoidCallback onPressed,

  }) {
    QuickAlert.show(
      context: context,
      barrierDismissible: false,
      title: AppStrings.success.tr(),
      text: message.tr(),
      type: QuickAlertType.success,
      confirmBtnText: AppStrings.continueText.tr(),
      confirmBtnColor: ColorManager.green,
      onConfirmBtnTap: onPressed,
    );
  }
}

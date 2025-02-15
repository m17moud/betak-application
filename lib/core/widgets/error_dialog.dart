
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../utils/color_manager.dart';
import '../utils/string_manager.dart';

class ErrorDialog {
  static void show({
    required BuildContext context,
    required String message,
    required VoidCallback onPressed,
  }) {
    QuickAlert.show(
      context: context,
      title: AppStrings.error.tr(),
      text: message.tr(),
      type: QuickAlertType.error,
      confirmBtnText: AppStrings.continueText.tr(),
      confirmBtnColor: ColorManager.error,
      onConfirmBtnTap: onPressed,
    );
  }
}

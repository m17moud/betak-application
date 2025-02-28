import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../utils/color_manager.dart';
import '../utils/string_manager.dart';
import '../utils/styles.dart';

class WarningDialog {
  static void show({
    required BuildContext context,
    required String message,
    required VoidCallback onPressed,
  }) {
    QuickAlert.show(
      context: context,
      title: AppStrings.warning.tr(),
      type: QuickAlertType.warning,
      text: message,
      confirmBtnText: AppStrings.confirm.tr(),
      confirmBtnColor: ColorManager.green,
      cancelBtnText: AppStrings.cancel.tr(),
      showCancelBtn: true,
      cancelBtnTextStyle:
          Styles.styleBoldIrinaSans20.copyWith(color: ColorManager.error),
      onCancelBtnTap: () {
        Navigator.pop(context);
      },
      onConfirmBtnTap: onPressed,
    );
  }
}

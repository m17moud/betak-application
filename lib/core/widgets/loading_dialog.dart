import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/string_manager.dart';
import '../utils/styles.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppStrings.pleaseWait.tr(),
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      actions: const [
        Center(
          child: CircularProgressIndicator(
            color: Styles.blueSky,
          ),
        )
      ],
    );
  }
}

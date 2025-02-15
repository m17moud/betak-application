// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../utils/color_manager.dart';
// import '../utils/routes_manager.dart';
// import '../utils/string_manager.dart';
// import '../utils/styles.dart';

// class SuccessSignupDialog extends StatelessWidget {
//   const SuccessSignupDialog({
//     super.key,
//     required this.clientOrMerchant,
//   });
//   final String clientOrMerchant;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         AppStrings.successSignup.tr(),
//         style: const TextStyle(color: ColorManager.green),
//       ),
//       contentTextStyle: const TextStyle(fontSize: 18, color: Styles.flyByNight),
//       content: Text(AppStrings.verifyEmailMessage.tr()),
//       actions: <Widget>[
//         TextButton(
//           child: Text(
//             AppStrings.ok.tr(),
//             style: const TextStyle(fontSize: 15),
//           ),
//           onPressed: () {
//             if (clientOrMerchant == "cleint") {
//               Navigator.pop(context); // hide dialog
//               Navigator.pushReplacementNamed(context, Routes.clientSignInRoute);
//             } else {
//               Navigator.pop(context); // hide dialog
//               Navigator.pushReplacementNamed(
//                   context, Routes.merchantSignInRoute);
//             }
//           },
//         ),
//       ],
//     );
//   }
// }



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
      title: AppStrings.success.tr(),
      text: message.tr(),
      type: QuickAlertType.success,
      confirmBtnText: AppStrings.continueText.tr(),
      confirmBtnColor: ColorManager.green,
      onConfirmBtnTap: onPressed,
    );
  }
}

import 'package:betak/app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(DevicePreview(
    builder: (context) => EasyLocalization(
        supportedLocales: const [Locale("ar")],
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        path: 'assets/translations',
        child: const BetakApplication()),
  ));

  // runApp(const Betak());
}

// class Betak extends StatelessWidget {
//   const Betak({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent, // Make the status bar transparent
//       statusBarIconBrightness:
//           Brightness.dark, // For dark icons on the status bar
//     ));
//     return const MaterialApp(
//       locale: Locale('ar', ''),
//       debugShowCheckedModeBanner: false,
//       // locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       home: MerchantSignInView(),
//     );
//   }
// }

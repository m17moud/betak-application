import 'app/app.dart';
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

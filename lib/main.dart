import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await di.init();
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

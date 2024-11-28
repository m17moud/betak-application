import 'package:betak/core/widgets/choose_user_type.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/views/client_sign_in_view.dart';
import 'package:betak/features/auth_for_client/sign_up/presentation/views/client_sign_up_view.dart';
import 'package:betak/features/auth_for_merchants/sign_in/presentation/views/merchant_sign_in_view.dart';
import 'package:betak/features/auth_for_merchants/sign_up/presentation/views/merchant_sign_up_view.dart';
import 'package:betak/features/home/presentation/views/home_view.dart';
import 'package:betak/features/splash/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class BetakApplication extends StatelessWidget {
  const BetakApplication({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // For dark icons on the status bar
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //  builder: DevicePreview.appBuilder,
      home: SplashView(),
    );
  }
}

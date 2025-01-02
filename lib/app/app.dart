import 'package:betak/features/auth_for_merchants/sign_up/presentation/pages/merchant_sign_up_view.dart';
import 'package:betak/features/home/presentation/pages/home_merchant_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/routes_manager.dart';

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
      // initialRoute: Routes.loadingSplashRoute,
      home: HomeMerchantView(),
      onGenerateRoute:
          RouteGenerator.getRoute, // Use RouteGenerator for navigation
    );
  }
}

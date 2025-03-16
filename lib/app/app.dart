import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/utils/routes_manager.dart';

class BetakApplication extends StatelessWidget {
  const BetakApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: DevicePreview.appBuilder,
      initialRoute: Routes.loadingSplashRoute,
      onGenerateRoute:
          RouteGenerator.getRoute, // Use RouteGenerator for navigation
    );
  }
}

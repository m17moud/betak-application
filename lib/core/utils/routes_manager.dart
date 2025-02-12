import '../widgets/choose_user_type.dart';
import '../../features/add_product/presentation/pages/add_product_screen.dart';
import '../../features/home/presentation/pages/home_merchant_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../features/auth_for_client/sign_in/presentation/pages/client_sign_in_view.dart';
import '../../features/auth_for_client/sign_up/presentation/pages/client_sign_up_view.dart';
import '../../features/auth_for_merchants/sign_in/presentation/pages/merchant_sign_in_view.dart';
import '../../features/auth_for_merchants/sign_up/presentation/pages/merchant_sign_up_view.dart';
import '../../features/home/presentation/pages/home_cleint_view.dart';
import '../../features/product/presentation/views/product_view.dart';
import '../../features/splash/presentation/views/loading_splash_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'color_manager.dart';
import 'string_manager.dart';

class Routes {
  static const String loadingSplashRoute = "/";
  static const String splashRoute = "/splash_view";
  static const String chooseUserType = "/choose_user_type";

  static const String clientSignInRoute = "/client_sign_in_view";
  static const String clientSignUpRoute = "/client_sign_up_view";
  static const String clientPasswordRoute = "/client_password_view";

  static const String merchantSignInRoute = "/merchant_sign_in_view";
  static const String merchantSignUpRoute = "/merchant_sign_up_view";

  static const String homeCleintRoute = "/home_cleint_view";
  static const String homeMerchantRoute = "/home_merchant_view";
  static const String productRoute = "/product_view";
  static const String addProductRoute = "/add_product_screen";

  // static const String instructionsRoute = "/iInstructionsScreen";

  static Map<String, dynamic> routesList = {
    loadingSplashRoute: const LoadingSplashView(),
    splashRoute: const SplashView(),
    clientSignInRoute: const ClientSignInView(),
    clientSignUpRoute: const ClientSignUpView(),
    merchantSignInRoute: const MerchantSignInView(),
    merchantSignUpRoute: const MerchantSignUpView(),
    homeCleintRoute: const HomeCleintView(),
    homeMerchantRoute: const HomeMerchantView(),
    productRoute: const ProductView(),
    addProductRoute: const AddProductScreen(),
    chooseUserType: const ChooseUserType(),
  };

  static Scaffold get unDefinedRoute {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: ColorManager.white),
        title: Text(AppStrings.noRouteFound[NoRoute.title.index]),
      ),
      body: Center(child: Text(AppStrings.noRouteFound[NoRoute.body.index])),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    if (settings.name != null) {
      try {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => Routes.routesList[settings.name]);
      } on Exception {
        return _unDefinedRoute();
      }
    } else {
      return _unDefinedRoute();
    }
  }

  static MaterialPageRoute _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Routes.unDefinedRoute,
    );
  }
}

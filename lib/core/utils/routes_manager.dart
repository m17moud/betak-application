import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/presentation/views/categorie_products_view.dart';
import 'package:betak/features/home/data/models/home_department_response_model.dart';
import 'package:betak/features/home/presentation/pages/home_merchant_view.dart';
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

  static const String clientSignInRoute = "/client_sign_in_view";
  static const String clientSignUpRoute = "/client_sign_up_view";
  static const String clientPasswordRoute = "/client_password_view";

  static const String merchantSignInRoute = "/merchant_sign_in_view";
  static const String merchantSignUpRoute = "/merchant_sign_up_view";

  static const String homeCleintRoute = "/home_cleint_view";
  static const String homeMerchantRoute = "/home_merchant_view";

  static const String categorieProducts = "/categorie_products_view";

  static const String productRoute = "/product_view";

  // static const String instructionsRoute = "/iInstructionsScreen";

  static Map<String, Widget Function(BuildContext, dynamic)> routesList = {
    loadingSplashRoute: (context, _) => const LoadingSplashView(),
    splashRoute: (context, _) => const SplashView(),
    clientSignInRoute: (context, _) => const ClientSignInView(),
    clientSignUpRoute: (context, _) => const ClientSignUpView(),
    merchantSignInRoute: (context, _) => const MerchantSignInView(),
    merchantSignUpRoute: (context, _) => const MerchantSignUpView(),
    homeCleintRoute: (context, _) => const HomeCleintView(),
    homeMerchantRoute: (context, _) => const HomeMerchantView(),
    categorieProducts: (context, args) => CategorieProductsView(
        departmentResponseModel: args as HomeDepartmentResponseModel),
    productRoute: (context, args) =>  ProductView(
        productsModel: args as ProductsModel),

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
  final routeName = settings.name;
  final arguments = settings.arguments;

  if (Routes.routesList.containsKey(routeName)) {
  return MaterialPageRoute(
  settings: settings,
  builder: (context) => Routes.routesList[routeName]!(context, arguments),
  );
  } else {
  return MaterialPageRoute(
  builder: (context) => Routes.unDefinedRoute,
  );
  }
  }
}

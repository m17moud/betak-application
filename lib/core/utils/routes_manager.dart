
import '../../features/manage_product/presentation/pages/manage_product_screen.dart';

import '../../features/category_products/data/models/products_model.dart';
import '../../features/category_products/presentation/views/category_products_view.dart';
import '../../features/home/data/models/home_department_response_model.dart';
import '../../features/product/presentation/views/widgets/merchant_product_view.dart';
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
import '../../features/product/presentation/views/client_product_view.dart';
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

  static const String categoryProducts = "/category_products_view";

  static const String clientProductRoute = "/client_product_view";
  static const String merchantProductRoute = "/merchant_product_view";
  static const String addProductRoute = "/add_product_screen";
  static const String updateProductRoute = "/manage_product_screen";


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
    categoryProducts: (context, args) => CategoryProductsView(
        departmentResponseModel: args as HomeDepartmentResponseModel),
    clientProductRoute: (context, args) =>  ClientProductView(
        productsModel: args as ProductsModel),
 merchantProductRoute: (context, args) =>  MerchantProductView(
        productsModel: args as ProductsModel),
    updateProductRoute: (context, args) =>  ManageProductScreen(
        product: args as ProductsModel),
    addProductRoute:  (context, _) =>const AddProductScreen(),
    chooseUserType:  (context, _) =>const ChooseUserType(),
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

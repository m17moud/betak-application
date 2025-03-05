import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import '../../../../auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _navigated = false;

  void _navigateToPage(BuildContext context, String routeName) {
    if (!_navigated) {
      _navigated = true;
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context, routeName, (route) => false,
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CustomerLoginCubit>().checkAuthStatus();
    context.read<MerchantLoginCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CustomerLoginCubit, CustomerLoginState>(
      builder: (context, customerState) {
        return BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, merchantState) {
            if (customerState is LoggedIn) {
              _navigateToPage(context, Routes.checkClientSession);
            } else if (merchantState is MerchantLoggedIn) {
              _navigateToPage(context, Routes.checkMerchantSession);
            } else if (customerState is LoggedOut &&
                merchantState is MerchantLoggedOut) {
              _navigateToPage(context, Routes.chooseUserType);
            }

            return Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.imagesLogo,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        AppStrings.splashScreenText.tr(),
                        style: Styles.styleBoldInriaSans16.copyWith(
                          color: ColorManager.white,
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.1,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.from.tr(),
                          style: Styles.styleBoldInriaSans16.copyWith(
                            color: ColorManager.textFormFillColor,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                        Text(
                          AppStrings.techMark.tr(),
                          style: Styles.styleBoldIrinaSans20.copyWith(
                            color: ColorManager.white,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

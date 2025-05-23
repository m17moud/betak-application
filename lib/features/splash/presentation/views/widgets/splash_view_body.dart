

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
  bool _showLoading = true;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    // Switch from loading indicator to text after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showLoading = false;
        });
        // Check authentication status after text appears
        context.read<CustomerLoginCubit>().checkAuthStatus();
        context.read<MerchantLoginCubit>().checkAuthStatus();
      }
    });
  }

  void _navigateToPage(BuildContext context, String routeName) {
    if (!_navigated) {
      _navigated = true;
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            routeName,
            (route) => false,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CustomerLoginCubit, CustomerLoginState>(
      builder: (context, customerState) {
        return BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, merchantState) {
            // Handle navigation only after loading is complete
            if (!_showLoading) {
              if (customerState is LoggedIn) {
                _navigateToPage(context, Routes.checkClientSession);
              } else if (merchantState is MerchantLoggedIn) {
                _navigateToPage(context, Routes.checkMerchantSession);
              } else if (customerState is LoggedOut &&
                  merchantState is MerchantLoggedOut) {
                _navigateToPage(context, Routes.chooseUserType);
              }
            }

            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        Assets.imagesLogo,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    _showLoading
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.035,
                              horizontal: screenWidth * 0.35,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const LinearProgressIndicator(
                                color: Styles.blueSky,
                              ),
                            ),
                          )
                        : Text(
                            AppStrings.splashScreenText.tr(),
                            style: Styles.styleBoldInriaSans16.copyWith(
                              color: ColorManager.white,
                              fontSize: screenWidth * 0.04,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ],
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
                          ),
                        ),
                        Text(
                          AppStrings.techMark.tr(),
                          style: Styles.styleBoldIrinaSans20.copyWith(
                            color: ColorManager.white,
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

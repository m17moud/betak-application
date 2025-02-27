import 'package:betak/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Navigator.pushReplacementNamed(context, routeName);
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
    return BlocBuilder<CustomerLoginCubit, CustomerLoginState>(
      builder: (context, customerState) {
        return BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, merchantState) {
            if (customerState is LoggedIn) {
              _navigateToPage(context, Routes.homeCleintRoute);
            } else if (merchantState is MerchantLoggedIn) {
              _navigateToPage(context, Routes.homeMerchantRoute);
            } else if (customerState is LoggedOut &&
                merchantState is MerchantLoggedOut) {
              _navigateToPage(context, Routes.chooseUserType);
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesLogo),
                  const SizedBox(height: 8),
                  const Text('أشترى,بيع,اكسب...كرر',
                      style: Styles.styleRegularJua15),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

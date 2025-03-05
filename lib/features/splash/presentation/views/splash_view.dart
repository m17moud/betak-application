import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../../../injection_container.dart';
import '../../../auth_for_client/client_check_session/presentation/cubit/client_check_session_cubit.dart';
import '../../../auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import '../../../auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MerchantLoginCubit>()),
        BlocProvider(create: (context) => sl<CustomerLoginCubit>()),
        BlocProvider(create: (context) => sl<ClientCheckSessionCubit>()),
      ],
      child: const Scaffold(
        backgroundColor: Styles.blueSky,
        body: SplashViewBody(),
      ),
    );
  }
}

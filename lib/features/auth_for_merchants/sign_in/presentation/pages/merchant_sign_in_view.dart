import 'package:betak/features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../injection_container.dart';

import '../widgets/merchant_sign_in_view_body.dart';

class MerchantSignInView extends StatelessWidget {
  const MerchantSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<MerchantLoginCubit>(),
        child: Scaffold(
          body: MerchantSignInViewBody(),
        ));
  }
}

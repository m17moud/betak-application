import '../cubit/merchant_sign_up_cubit.dart';
import '../../../../home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../widgets/merchant_sign_up_view_body.dart';

class MerchantSignUpView extends StatelessWidget {
  const MerchantSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MerchantSignUpCubit>(),
      child:  Scaffold(
        body: BlocProvider(
          create: (context) => sl<HomeCubit>(),
          child: MerchantSignUpViewBody(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../cubit/customer_login_cubit.dart';
import '../widgets/client_sign_in_view_body.dart';

class ClientSignInView extends StatelessWidget {
  const ClientSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<CustomerLoginCubit>(),
        child: Scaffold(
          body: ClientSignInViewBody(),
        ));
  }
}

import 'package:betak/features/auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/widgets/client_sign_in_view_body.dart';
import 'package:betak/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientSignInView extends StatelessWidget {
  const ClientSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerLoginCubit>(), // Using your dependency injection
      child: const Scaffold(
        body: ClientSignInViewBody(),
      )
    );

  }
}

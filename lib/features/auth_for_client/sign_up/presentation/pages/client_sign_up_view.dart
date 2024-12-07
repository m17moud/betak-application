import 'package:betak/features/auth_for_client/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:betak/features/auth_for_client/sign_up/presentation/widgets/client_sign_up_view_body.dart';
import 'package:flutter/material.dart';

import 'package:betak/injection_container.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ClientSignUpView extends StatelessWidget {
  const ClientSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider (
        create: (_) => sl<SignUpCubit>(), // Using your dependency injection
        child: const Scaffold(
          body: ClientSignUpViewBody(),
        )
    );
  }
}

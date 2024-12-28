import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/client_sign_up_view_body.dart';
class ClientSignUpView extends StatelessWidget {
  const ClientSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider (
        create: (_) => sl<SignUpCubit>(), 
        child: const Scaffold(
          body: ClientSignUpViewBody(),
        )
    );
  }
}

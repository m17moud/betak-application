import 'package:betak/features/auth_for_client/sign_up/presentation/widgets/client_sign_up_view_body.dart';
import 'package:flutter/material.dart';

class ClientSignUpView extends StatelessWidget {
  const ClientSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClientSignUpViewBody(),
    );
  }
}

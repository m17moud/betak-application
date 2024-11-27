import 'package:betak/features/auth_for_client/sign_in/presentation/views/widgets/client_sign_in_view_body.dart';
import 'package:flutter/material.dart';

class ClientSignInView extends StatelessWidget {
  const ClientSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClientSignInViewBody(),
    );
  }
}

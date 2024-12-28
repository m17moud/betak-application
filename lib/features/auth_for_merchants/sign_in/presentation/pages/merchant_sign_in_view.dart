import 'package:flutter/material.dart';

import '../widgets/merchant_sign_in_view_body.dart';

class MerchantSignInView extends StatelessWidget {
  const MerchantSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MerchantSignInViewBody(),
    );
  }
}

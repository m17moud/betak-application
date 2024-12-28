import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/loading_splash_view_body.dart';

class LoadingSplashView extends StatelessWidget {
  const LoadingSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.blueSky,
      body: LoadingSplashViewBody(),
    );
  }
}

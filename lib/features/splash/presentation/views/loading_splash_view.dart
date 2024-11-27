import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/splash/presentation/views/widgets/loading_splash_view_body.dart';
import 'package:flutter/material.dart';

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

import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.blueSky,
      body: SplashViewBody(),
    );
  }
}

import 'package:betak/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/generated/assets.dart';

class LoadingSplashViewBody extends StatefulWidget {
  const LoadingSplashViewBody({super.key});

  @override
  State<LoadingSplashViewBody> createState() => _LoadingSplashViewBodyState();
}

class _LoadingSplashViewBodyState extends State<LoadingSplashViewBody> {
  @override
  void initState() {
    super.initState();
    // Navigate to another view after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashView()), // Replace NextScreen with your target screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset(Assets.imagesLogo)),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 145, right: 136),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const LinearProgressIndicator(
                color: Styles.blueSky,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

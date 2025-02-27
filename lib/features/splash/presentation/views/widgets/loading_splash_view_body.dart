import 'package:betak/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';

class LoadingSplashViewBody extends StatefulWidget {
  const LoadingSplashViewBody({super.key});

  @override
  State<LoadingSplashViewBody> createState() => _LoadingSplashViewBodyState();
}

class _LoadingSplashViewBodyState extends State<LoadingSplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.splashRoute);
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

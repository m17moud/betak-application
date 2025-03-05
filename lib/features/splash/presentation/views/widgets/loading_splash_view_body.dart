import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
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
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.splashRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                Assets.imagesLogo,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.35,
                ),
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
        ),
        Positioned(
          bottom: screenHeight * 0.1,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Text(AppStrings.from.tr(),
                    style: Styles.styleBoldInriaSans16
                        .copyWith(color: ColorManager.textFormFillColor)),
                Text(AppStrings.techMark.tr(),
                    style: Styles.styleBoldIrinaSans20
                        .copyWith(color: ColorManager.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

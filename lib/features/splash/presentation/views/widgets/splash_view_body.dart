import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    // Navigate to another view after 5 seconds
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingView()), // Replace NextScreen with your target screen
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
        const SizedBox(height: 8,),
        const Center(child: Text('أشترى,بيع,اكسب...كرر',style: Styles.styleRegularJua15,)),
      ],
    );
  }
}

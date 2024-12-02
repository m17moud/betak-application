import 'package:betak/generated/assets.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/choose_user_type.dart';
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
    // Navigate to another view after 1 seconds
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const ChooseUserType()), // Replace NextScreen with your target screen
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

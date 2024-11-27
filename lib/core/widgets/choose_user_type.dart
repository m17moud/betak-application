import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseUserType extends StatelessWidget {
  const ChooseUserType({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45,
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            height: screenHeight * .2,
          )),
          const SizedBox(
            height: 30,
          ),
          Text(
            "تسجيل الدخول كــ...",
            style: Styles.styleSemiBoldInter22.copyWith(color: Styles.flyByNight),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomButton1(
              backgroundColor: Styles.blueSky,
              onPressed: () {},
              text: 'عميل',
              textStyle:
                  Styles.styleSemiBoldInter22.copyWith(color: Colors.white),
              buttonWidth: screenWidth * 0.9,
              buttonHeight: screenHeight * .08,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomButton1(
              backgroundColor: Styles.blueSky,
              onPressed: () {},
              text: 'تاجر',
              textStyle:
                  Styles.styleSemiBoldInter22.copyWith(color: Colors.white),
              buttonWidth: screenWidth * 0.9,
              buttonHeight: screenHeight * .08,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    ));
  }
}

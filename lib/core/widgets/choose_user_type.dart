import '../utils/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/routes_manager.dart';
import '../utils/styles.dart';
import 'custom_button.dart';

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
            AppStrings.chooseUserType.tr(),
            style:
                Styles.styleSemiBoldInter22.copyWith(color: Styles.flyByNight),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomButton1(
              backgroundColor: Styles.blueSky,
              onPressed: () {
                Navigator.pushNamed(context, Routes.clientSignInRoute);
              },
              text: AppStrings.cleint.tr(),
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
              onPressed: () {
                Navigator.pushNamed(context, Routes.merchantSignInRoute);
              },
              text: AppStrings.seller.tr(),
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

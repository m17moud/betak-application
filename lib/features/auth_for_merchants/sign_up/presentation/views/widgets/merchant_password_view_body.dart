import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/password_text_field.dart';
import '../../../../../../generated/assets.dart';

class MerchantPasswordViewBody extends StatelessWidget {
  const MerchantPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF455A64),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Center(child: SvgPicture.asset(Assets.imagesLogo1)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'أنشئ كلمة المرور',
              style: Styles.styleSemiBoldInter30
                  .copyWith(color: Styles.blueSky),
            ),
            Text(
              'الخاصة بك',
              style: Styles.styleSemiBoldInter30
                  .copyWith(color: Styles.blueSky, height: .5),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 14),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            PasswordTextField(
              hintColor: const Color(0xFF5D5D60),
              borderRadius: 12,
              hint: 'Create your Password',
              checkVisibility: false,
              screenWidth: screenWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 14),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            PasswordTextField(
              hintColor: const Color(0xFF5D5D60),
              borderRadius: 12,
              hint: 'Confirm your Password',
              checkVisibility: false,
              screenWidth: screenWidth,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomButton1(
                backgroundColor: Styles.blueSky,
                onPressed: () {},
                text: 'تسجيل حساب جديد',
                textStyle:
                Styles.styleSemiBoldInter18.copyWith(color: Colors.white),
                buttonWidth: screenWidth * 0.9,
                buttonHeight: screenHeight * .08,
                borderRadius: BorderRadius.circular(12),
              ),
            ),

          ],
        ));
  }
}

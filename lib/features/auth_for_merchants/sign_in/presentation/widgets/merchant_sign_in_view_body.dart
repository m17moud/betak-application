import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../../core/widgets/text_form_validation.dart';
import '../../../../../generated/assets.dart';

class MerchantSignInViewBody extends StatefulWidget {
  const MerchantSignInViewBody({super.key});

  @override
  State<MerchantSignInViewBody> createState() => _MerchantSignInViewBodyState();
}

class _MerchantSignInViewBodyState extends State<MerchantSignInViewBody> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        children: [
                              const SizedBox(height: 60),

          Center(child: SvgPicture.asset(Assets.imagesLogo1)),
          const SizedBox(
            height: 25,
          ),
          Text(
            'تسجيل دخول التاجر',
            style: Styles.styleSemiBoldInter30.copyWith(color: Styles.blueSky),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: .5,
                    color: Color(0xFF5D5E61),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  'سجل دخولك عبر البريد الالكتروني',
                  style: Styles.styleRegularInter16
                      .copyWith(color: const Color(0xFF5D5E61)),
                ),
                const SizedBox(
                  width: 13,
                ),
                const Expanded(
                  child: Divider(
                    thickness: .5,
                    color: Color(0xFF5D5E61),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'عنوان البريد الالكتروني',
              textAlign: TextAlign.right,
              style: Styles.styleSemiBoldInter20
                  .copyWith(color: Styles.flyByNight),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 65,
            width: screenWidth * 9,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E3E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: CustomTextField(
                icon: Icons.email,
                validator: validateEmail,
                hint: 'قم بادخال بريدك الالكتروني',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'كلمة المرور',
              style: Styles.styleSemiBoldInter20
                  .copyWith(color: Styles.flyByNight),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          PasswordTextField(
            validator: validatePassword,
            borderRadius: 12,
            hint: 'قم بادخال كلمة المرور',
            checkVisibility: true,
            screenWidth: screenWidth,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: const Text("هل نسيت كلمة السر؟"),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ليس لديك حساب؟ ",
                style: Styles.styleSemiBoldInter20
                    .copyWith(color: Styles.flyByNight),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.merchantSignUpRoute);
                },
                child: Text(
                  "إنشاء حساب",
                  style: Styles.styleSemiBoldInter20
                      .copyWith(color: Styles.blueSky),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight > 892 ? 40 : 30,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CustomButton1(
              backgroundColor: Styles.blueSky,
              onPressed: () {},
              text: 'تسجيل الدخول',
              textStyle:
                  Styles.styleSemiBoldInter18.copyWith(color: Colors.white),
              buttonWidth: screenWidth * 0.9,
              buttonHeight: screenHeight * .08,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}

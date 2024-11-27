import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/views/widgets/facebook_sign_up_button.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/views/widgets/google_sign_up_button.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/widgets/password_text_field.dart';

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
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 45,
          ),
          Row(
            children: [
              Align(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF455A64),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
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
            height: 10,
          ),
          Container(
            height: 65,
            width: screenWidth * 9,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E3E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  border: InputBorder.none,
                  hintText: 'قم بادخال بريدك الالكتروني',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
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
            height: 10,
          ),
          PasswordTextField(
            borderRadius: 12,
            hint: 'قم بادخال كلمة المرور',
            checkVisibility: true,
            screenWidth: screenWidth,
          ),
          SizedBox(height: 20,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ليس لديك حساب؟ ",
                style: Styles.styleSemiBoldInter20
                    .copyWith(color: Styles.flyByNight),
              ),
              InkWell(
                onTap: () {},
                child: Text("إنشاء حساب",  style: Styles.styleSemiBoldInter20
                  .copyWith(color: Styles.blueSky),),
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

import 'package:betak/generated/assets.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/widgets/custom_title_text.dart';
import '../../../../../core/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_text_field.dart';

class ClientSignUpViewBody extends StatefulWidget {
  const ClientSignUpViewBody({super.key});

  @override
  State<ClientSignUpViewBody> createState() => _ClientSignUpViewBodyState();
}

class _ClientSignUpViewBodyState extends State<ClientSignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Styles.flyByNight,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: SvgPicture.asset(
              Assets.imagesLogo1,
              height: 70,
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              ' سجل حساب جديد',
              style:
                  Styles.styleSemiBoldInter30.copyWith(color: Styles.blueSky),
            ),
            CustomTitleText(text: "اسم المستخدم"),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخال اسمك',
            ),
            CustomTitleText(text: 'البريد الالكتروني'),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخال بريدك الالكتروني',
            ),
            CustomTitleText(
              text: 'رقم الهاتف',
            ),
            PhoneField(
              screenWidth: screenWidth,
            ),
            CustomTitleText(
              text: 'كلمة المرور',
            ),
            PasswordTextField(
              hintColor: const Color(0xFF5D5D60),
              borderRadius: 12,
              hint: 'أنشئ كلمة مرور حسابك',
              checkVisibility: false,
              screenWidth: screenWidth,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitleText(text: "لديك حساب بالفعل؟ "),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.clientSignInRoute);
                    },
                    child: CustomTitleText(
                      text: "تسجيل الدخول",
                      style: Styles.styleSemiBoldInter20
                          .copyWith(color: Styles.blueSky),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 5),
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
        ),
      ),
    );
  }
}

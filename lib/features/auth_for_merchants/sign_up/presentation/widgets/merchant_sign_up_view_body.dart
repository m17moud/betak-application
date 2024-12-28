import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_title_text.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../../core/widgets/phone_text_field.dart';
import '../../../../../core/widgets/text_form_validation.dart';
import '../../../../../generated/assets.dart';
import 'category_list.dart';

class MerchantSignUpViewBody extends StatefulWidget {
  const MerchantSignUpViewBody({super.key});

  @override
  State<MerchantSignUpViewBody> createState() => _MerchantSignUpViewBodyState();
}

class _MerchantSignUpViewBodyState extends State<MerchantSignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
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
              const CustomTitleText(text: "اسم المستخدم"),
              const CustomTextField(
                icon: Icons.person,
                validator: validateUsername,
                hint: 'قم بادخال اسمك',
              ),
              const CustomTitleText(text: "البريد الالكتروني"),
              const CustomTextField(
                icon: Icons.email,
                validator: validateEmail,
                hint: 'قم بادخال بريدك الالكتروني',
              ),
              const CustomTitleText(text: "المتجر"),
              const CustomTextField(
                icon: Icons.store,
                validator: validateShop,
                hint: 'قم بادخل اسم المتجر الخاص بك',
              ),
              const CustomTitleText(text: "العنوان"),
              const CustomTextField(
                icon: Icons.edit_road_rounded,
                validator: validateAddress,
                hint: 'قم بادخال عنوانك',
              ),
              const CustomTitleText(text: "رقم الهاتف"),
              PhoneTextField(
                icon: Icons.phone,
                validator: validatePhoneNumber,
                screenWidth: screenWidth,
              ),
              const CustomTitleText(text: "نوع المنتجات"),
              const CategoryList(),
              const CustomTitleText(text: "حساب الفيسبوك"),
              const CustomTextField(
                icon: Icons.facebook,
                validator: validateFacebookLink,
                hint: 'رابط حسابك على الفيسبوك',
              ),
              const CustomTitleText(text: "كلمة المرور"),
              PasswordTextField(
                validator: validatePassword,
                hintColor: Styles.flyByNight,
                borderRadius: 12,
                hint: 'أنشئ كلمة مرور حسابك',
                checkVisibility: false,
                screenWidth: screenWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لديك حساب بالفعل؟ ",
                    style: Styles.styleSemiBoldInter20
                        .copyWith(color: Styles.flyByNight),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.merchantSignInRoute);
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: Styles.styleSemiBoldInter20
                          .copyWith(color: Styles.blueSky),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 5),
                child: CustomButton1(
                  backgroundColor: Styles.blueSky,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {}
                  },
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
      ),
    );
  }
}

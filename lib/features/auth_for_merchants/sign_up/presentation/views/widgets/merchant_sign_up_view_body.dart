import 'package:betak/generated/assets.dart';

import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../core/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/password_text_field.dart';

class MerchantSignUpViewBody extends StatefulWidget {
  const MerchantSignUpViewBody({super.key});

  @override
  State<MerchantSignUpViewBody> createState() => _MerchantSignUpViewBodyState();
}

class _MerchantSignUpViewBodyState extends State<MerchantSignUpViewBody> {

  var _dropDownValue = 'ازياء نسائيه';
  final _items = [
    'ازياء نسائيه',
    'اجهزه اللابتوب',
    'العاب الفيديو',
    'اثاث',
    'اجهزه منزليه',
    'الالكترونيات'
  ];

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
                      color: Color(0xFF455A64),
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
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'اسم المستخدم',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخال اسمك',
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'البريد الالكتروني',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخال بريدك الالكتروني',
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'المتجر',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخل اسم المتجر الخاص بك',
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'العنوان',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'قم بادخال عنوانك',
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'رقم الهاتف',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            PhoneField(
              screenWidth: screenWidth,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'نوع المنتجات',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            Container(
              height: 65,
              width: screenWidth * 9,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E8),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButton(
                    iconSize: 30,
                    underline: const SizedBox(),
                    isExpanded: true,
                    items: _items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropDownValue = newValue!;
                      });
                    },
                    value: _dropDownValue,
                  ),
                ),
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'حساب الفيسبوك',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            CustomTextField(
              screenWidth: screenWidth,
              hint: 'رابط حسابك على الفيسبوك',
            ),
            const SizedBox(
              height: 10,
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 2, bottom: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور',
                    style: Styles.styleSemiBoldInter20,
                  )),
            ),
            PasswordTextField(
              hintColor: const Color(0xFF5D5D60),
              borderRadius: 12,
              hint: 'أنشئ كلمة مرور حسابك',
              checkVisibility: false,
              screenWidth: screenWidth,
            ),
            const SizedBox(
              height: 20,
            ),
               Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "لديك حساب بالفعل؟ ",
                style: Styles.styleSemiBoldInter20
                    .copyWith(color: Styles.flyByNight),
              ),
              InkWell(
                onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.merchantSignInRoute);
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
              padding: const EdgeInsets.only(bottom: 30,top: 5),
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

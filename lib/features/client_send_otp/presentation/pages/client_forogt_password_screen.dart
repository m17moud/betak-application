import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:betak/core/widgets/custom_text_field.dart';
import 'package:betak/core/widgets/text_form_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClientForogtPasswordScreen extends StatelessWidget {
  const ClientForogtPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth * 0.06;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.forgotPassword.tr(),
            style:
                Styles.styleBoldIrinaSans20.copyWith(color: ColorManager.white),
          ),
        ),
        backgroundColor: Styles.flyByNight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: screenHeight * 0.2,
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  AppStrings.enterEmailToVerify.tr(),
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextField(
                  controller: emailController,
                  hint: AppStrings.enterYourEmail.tr(),
                  validator: validateEmail,
                  icon: Icons.email,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButton1(
                  buttonHeight: screenHeight * 0.07,
                  buttonWidth: screenWidth,
                  backgroundColor: Styles.blueSky,
                  text: AppStrings.confirm.tr(),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.pushReplacementNamed(
                          context, Routes.clientVerifyOtpRoute,
                          arguments: emailController.text.trim());
                    }
                  },
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:betak/core/widgets/custom_title_text.dart';
import 'package:betak/core/widgets/password_text_field.dart';
import 'package:betak/core/widgets/text_form_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClientResetPasswordScreen extends StatelessWidget {
  const ClientResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          AppStrings.createNewPassword.tr(),
          style:
              Styles.styleBoldIrinaSans20.copyWith(color: ColorManager.white),
        )),
        backgroundColor: Styles.flyByNight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.33,
                  child: Image.asset(
                    "assets/images/reset password.png",
                  ),
                ),
                CustomTitleText(
                  text: AppStrings.password.tr(),
                ),
                PasswordTextField(
                  validator: validatePassword,
                  hintColor: const Color(0xFF5D5D60),
                  borderRadius: 12,
                  hint: AppStrings.createYourPassword.tr(),
                  checkVisibility: false,
                  screenWidth: screenWidth,
                  controller: passwordController,
                ),
                SizedBox(height: screenHeight * 0.01),
                CustomTitleText(
                  text: AppStrings.confirmPassword.tr(),
                ),
                PasswordTextField(
                  validator: validatePassword,
                  hintColor: const Color(0xFF5D5D60),
                  borderRadius: 12,
                  hint: AppStrings.rewritePassword.tr(),
                  checkVisibility: false,
                  screenWidth: screenWidth,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButton1(
                  buttonHeight: screenHeight * 0.07,
                  buttonWidth: screenWidth,
                  backgroundColor: Styles.blueSky,
                  text: AppStrings.confirm.tr(),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppStrings.passwordsNotEqual.tr(),
                              style: Styles.styleBoldIrinaSans20
                                  .copyWith(color: ColorManager.white),
                            ),
                            backgroundColor: ColorManager.error,
                          ),
                        );
                      } else {}
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import '../cubit/merchant_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../../core/widgets/text_form_validation.dart';
import '../../../../../generated/assets.dart';
import '../../../../../core/widgets/login_error_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/widgets/custom_title_text.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MerchantSignInViewBody extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<MerchantLoginCubit, MerchantLoginState>(
      listener: (context, state) {
        if (state is Loading) {
          showDialog(
            context: context,
            builder: (context) {
              return const LoadingDialog();
            },
          );
        } else if (state is LoggedIn) {
          Navigator.of(context).pop(); // Hide loading dialog
          Navigator.pushReplacementNamed(context, Routes.homeMerchantRoute);
        } else if (state is LoginError) {
          Navigator.of(context).pop(); // Hide loading dialog
          showDialog(
            context: context,
            builder: (context) {
              return LoginErrorDialog(message: state.message);
            },
          );
        }
      },
      builder: (context, state) {
        return Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Center(child: SvgPicture.asset(Assets.imagesLogo1)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTitleText(
                          text: AppStrings.merchantSignIn.tr(),
                          style: Styles.styleSemiBoldInter30
                              .copyWith(color: Styles.blueSky),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Color(0xFF5D5E61),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomTitleText(
                            text: AppStrings.loginWithEmail.tr(),
                            style: Styles.styleRegularInter16
                                .copyWith(color: const Color(0xFF5D5E61)),
                          ),
                          const SizedBox(width: 13),
                          const Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Color(0xFF5D5E61),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomTitleText(
                        text: AppStrings.email.tr(),
                        style: Styles.styleSemiBoldInter20
                            .copyWith(color: Styles.flyByNight),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      icon: Icons.email,
                      validator: validateEmail,
                      hint: AppStrings.enterYourEmail.tr(),
                      controller: _emailController,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomTitleText(
                        text: AppStrings.password.tr(),
                        style: Styles.styleSemiBoldInter20
                            .copyWith(color: Styles.flyByNight),
                      ),
                    ),
                    const SizedBox(height: 5),
                    PasswordTextField(
                      validator: validatePassword,
                      borderRadius: 12,
                      hint: AppStrings.enterYourPassword.tr(),
                      checkVisibility: true,
                      screenWidth: screenWidth,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.forgotPassword.tr()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTitleText(
                          text: AppStrings.dontHaveAccount.tr(),
                          style: Styles.styleSemiBoldInter20
                              .copyWith(color: Styles.flyByNight),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.merchantSignUpRoute);
                          },
                          child: CustomTitleText(
                            text: AppStrings.signUp.tr(),
                            style: Styles.styleSemiBoldInter20
                                .copyWith(color: Styles.blueSky),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight > 892 ? 40 : 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                      child: CustomButton1(
                        backgroundColor: Styles.blueSky,
                        onPressed: () {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          if (_formKey.currentState?.validate() ?? false) {
                            context
                                .read<MerchantLoginCubit>()
                                .login(email, password);
                          }
                        },
                        text: AppStrings.login.tr(),
                        textStyle: Styles.styleSemiBoldInter18
                            .copyWith(color: Colors.white),
                        buttonWidth: screenWidth * 0.9,
                        buttonHeight: screenHeight * 0.08,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

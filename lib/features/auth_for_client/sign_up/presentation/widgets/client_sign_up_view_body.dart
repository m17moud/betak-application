import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_title_text.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../../core/widgets/phone_text_field.dart';
import '../../../../../core/widgets/success_dialog.dart';
import '../../../../../core/widgets/text_form_validation.dart';
import '../../../../../generated/assets.dart';
import '../cubit/sign_up_cubit.dart';

class ClientSignUpViewBody extends StatefulWidget {
  const ClientSignUpViewBody({super.key});

  @override
  State<ClientSignUpViewBody> createState() => _ClientSignUpViewBodyState();
}

class _ClientSignUpViewBodyState extends State<ClientSignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const LoadingDialog();
            },
          );
        } else if (state is SignUpSuccess) {
          Navigator.of(context).pop(); // Hide loading dialog

          SuccessDialog.show(
            context: context,
            message: AppStrings.verifyEmailMessage,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.clientSignInRoute,
                (route) => false,
              );
            },
          );
        } else if (state is SignUpError) {
          Navigator.pop(context); // Hide loading dialog
          ErrorDialog.show(
            context: context,
            message: state.message,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: SvgPicture.asset(Assets.imagesLogo1, height: 70),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.createNewAccount.tr(),
                  style: Styles.styleSemiBoldInter30
                      .copyWith(color: Styles.blueSky),
                ),
                CustomTitleText(
                  text: AppStrings.username.tr(),
                ),
                CustomTextField(
                  icon: Icons.person_2_rounded,
                  validator: validateUsername,
                  hint: AppStrings.enterYourName.tr(),
                  controller: _nameController,
                ),
                CustomTitleText(
                  text: AppStrings.email.tr(),
                ),
                CustomTextField(
                  icon: Icons.email,
                  validator: validateEmail,
                  hint: AppStrings.enterYourEmail.tr(),
                  controller: _emailController,
                ),
                CustomTitleText(
                  text: AppStrings.phoneNumber.tr(),
                ),
                PhoneTextField(
                  icon: Icons.phone,
                  validator: validatePhoneNumber,
                  screenWidth: screenWidth,
                  controller: _phoneController,
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
                  controller: _passwordController,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTitleText(
                      text: AppStrings.alreadyHaveAcount.tr(),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.clientSignInRoute);
                        },
                        child: CustomTitleText(
                          text: AppStrings.login.tr(),
                          style: Styles.styleSemiBoldInter20
                              .copyWith(color: Styles.blueSky),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 5),
                  child: CustomButton1(
                    backgroundColor: Styles.blueSky,
                    onPressed: () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      final name = _nameController.text.trim();
                      final phone = _phoneController.text.trim();
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<SignUpCubit>()
                            .signup(name, email, password, phone);
                      }
                    },
                    text: AppStrings.signUp.tr(),
                    textStyle: Styles.styleSemiBoldInter18
                        .copyWith(color: Colors.white),
                    buttonWidth: screenWidth * 0.9,
                    buttonHeight: screenHeight * .08,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

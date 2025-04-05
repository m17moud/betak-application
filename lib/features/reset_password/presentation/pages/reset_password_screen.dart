import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_title_text.dart';
import '../../../../core/widgets/error_dialog.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../core/widgets/success_dialog.dart';
import '../../../../core/widgets/text_form_validation.dart';
import '../../../../features/reset_password/presentation/cubit/reset_password_cubit.dart';
import '../../../../injection_container.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String userType;
  final String userEmail;

  const ResetPasswordScreen(
      {super.key, required this.userType, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: ResetPasswordView(userType: userType, userEmail: userEmail),
    );
  }
}

class ResetPasswordView extends StatefulWidget {
  final String userType;
  final String userEmail;

  const ResetPasswordView(
      {super.key, required this.userType, required this.userEmail});

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.createNewPassword.tr(),
            style:
                Styles.styleBoldIrinaSans20.copyWith(color: ColorManager.white),
          ),
        ),
        backgroundColor: Styles.flyByNight,
      ),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingDialog(),
            );
          } else if (state is ResetPasswordSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.chooseUserType,
              (route) => true,
            );

            SuccessDialog.show(
              context: context,
              message: AppStrings.resetPasswordSuccess.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          } else if (state is ResetPasswordError) {
            // Close loading dialog and show error dialog
            Navigator.pop(context);

            ErrorDialog.show(
              context: context,
              message: state.message,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.33,
                    child: Image.asset("assets/images/reset password.png"),
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
                                AppStrings.notEqualPassword.tr(),
                                style: Styles.styleBoldIrinaSans20
                                    .copyWith(color: ColorManager.white),
                              ),
                              backgroundColor: ColorManager.error,
                            ),
                          );
                        } else {
                          context.read<ResetPasswordCubit>().resetPassword(
                              widget.userEmail,
                              widget.userType,
                              passwordController.text);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

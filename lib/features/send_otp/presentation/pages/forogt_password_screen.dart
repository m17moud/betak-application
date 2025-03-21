import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/error_dialog.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/text_form_validation.dart';
import '../../../../injection_container.dart';
import '../cubit/send_otp_cubit.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String userType;
  const ForgotPasswordScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SendOtpCubit>(),
      child: ForgotPasswordView(
        userType: userType,
      ),
    );
  }
}

class ForgotPasswordView extends StatefulWidget {
  final String userType;

  const ForgotPasswordView({super.key, required this.userType});

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      body: BlocListener<SendOtpCubit, SendOtpState>(
        listener: (context, state) {
          if (state is SendOtpLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingDialog(),
            );
          } else if (state is SendOtpSuccess) {
            Navigator.pushReplacementNamed(
              context,
              Routes.verifyOtpRoute,
              arguments: {
                'userType': widget.userType,
                'userEmail': emailController.text.trim()
              },
            );
          } else if (state is SendOtpError) {
            Navigator.pop(context); // Hide loading dialog
            ErrorDialog.show(
              context: context,
              message: state.message.tr(),
              onPressed: () => Navigator.pop(context),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
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
                      fontWeight: FontWeight.bold,
                    ),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<SendOtpCubit>().sendOTP(
                              emailController.text.trim(),
                              widget.userType,
                            );
                      }
                    },
                    fontSize: fontSize,
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

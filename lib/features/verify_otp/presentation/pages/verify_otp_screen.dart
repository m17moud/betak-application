// ignore_for_file: use_build_context_synchronously

import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:betak/core/widgets/error_dialog.dart';
import 'package:betak/core/widgets/loading_dialog.dart';
import 'package:betak/features/verify_otp/presentation/cubit/verify_otp_cubit.dart';
import 'package:betak/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

class VerifyOtpScreen extends StatelessWidget {
  final String userType;
  final String userEmail;

  const VerifyOtpScreen(
      {super.key, required this.userEmail, required this.userType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyOtpCubit>(),
      child: VerifyOtpView(userEmail: userEmail, userType: userType),
    );
  }
}

class VerifyOtpView extends StatefulWidget {
  final String userType;
  final String userEmail;

  const VerifyOtpView(
      {super.key, required this.userEmail, required this.userType});

  @override
  _VerifyOtpViewState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  final formKey = GlobalKey<FormState>();

  String otp = '';
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Styles.blueSky;
    const errorBorderColor = ColorManager.error;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.15,
      height: screenWidth * 0.15,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.055,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isValid ? borderColor : errorBorderColor, width: 2),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.flyByNight,
        title: Center(
          child: Text(
            AppStrings.verifyEmail.tr(),
            style:
                Styles.styleBoldIrinaSans20.copyWith(color: ColorManager.white),
          ),
        ),
      ),
      body: BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is VerifyOtpLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingDialog(),
            );
          } else if (state is VerifyOtpSuccess) {
            Navigator.pop(context); // Ensure dialog is closed before navigation
            Future.microtask(() {
              Navigator.pushReplacementNamed(
                context,
                Routes.resetPasswordRoute,
                arguments: {
                  'userType': widget.userType,
                  'userEmail': widget.userEmail
                },
              );
            });
          } else if (state is VerifyOtpError) {
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
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "${AppStrings.enterOtp.tr()} \n ${widget.userEmail}",
                  textAlign: TextAlign.center,
                  style: Styles.styleBoldIrinaSans20,
                ),
                SizedBox(height: screenWidth * 0.05),
                Directionality(textDirection: ui.TextDirection.ltr,
                  child: Pinput(
                    controller: pinController,
                    focusNode: focusNode,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) =>
                        SizedBox(width: screenWidth * 0.03),
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                        isValid = true;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return AppStrings.invalidOtp.tr();
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),
                CustomButton1(
                  buttonHeight: screenHeight * 0.07,
                  buttonWidth: screenWidth * 0.4,
                  backgroundColor: Styles.blueSky,
                  text: AppStrings.confirm.tr(),
                  onPressed: () {
                    focusNode.unfocus();
                    if (formKey.currentState!.validate()) {
                      context.read<VerifyOtpCubit>().verifyOtp(
                            widget.userEmail,
                            widget.userType,
                            int.parse(otp),
                          );
                    } else {
                      setState(() {
                        isValid = false;
                      });
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

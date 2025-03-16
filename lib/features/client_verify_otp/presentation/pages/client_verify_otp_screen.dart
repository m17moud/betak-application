import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ClientVerifyOtpScreen extends StatefulWidget {
  final String userEmail;
  const ClientVerifyOtpScreen({super.key, required this.userEmail});

  @override
  // ignore: library_private_types_in_public_api
  _ClientVerifyOtpScreenState createState() => _ClientVerifyOtpScreenState();
}

class _ClientVerifyOtpScreenState extends State<ClientVerifyOtpScreen> {
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
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text("${AppStrings.enterOtp.tr()} \n ${widget.userEmail}",
                  textAlign: TextAlign.center,
                  style: Styles.styleBoldIrinaSans20),
              SizedBox(height: screenWidth * 0.05),
              Pinput(
                closeKeyboardWhenCompleted: true,
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
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.clientResetPasswordRoute,
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
    );
  }
}

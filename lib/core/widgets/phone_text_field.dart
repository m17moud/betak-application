import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key, required this.screenWidth});
  final double screenWidth;


  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 65,
        width: widget.screenWidth * 9,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E3E8),

          borderRadius: BorderRadius.circular(12),
        ),
        child: IntlPhoneField(
          // flagsButtonPadding: EdgeInsets.only(top: .25*65),
          focusNode: focusNode,
          decoration: const InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: .3*65, horizontal: 20.0),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xFF5D5D60),
            ),
          ),
          languageCode: "en",
          onChanged: (phone) {
            debugPrint(phone.completeNumber);
          },
          onCountryChanged: (country) {
            debugPrint('Country changed to: ${country.name}');
          },
          disableLengthCheck: true,

        ),
      ),
    );
  }
}
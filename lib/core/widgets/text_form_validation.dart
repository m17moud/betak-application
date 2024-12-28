import 'package:easy_localization/easy_localization.dart';

import '../utils/string_manager.dart';

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourUsername.tr();
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourEmail.tr();
  }
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!regex.hasMatch(value)) {
    return AppStrings.pleaseEnterAValidEmail.tr();
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourPass.tr();
  }
  if (value.length < 6) {
    return AppStrings.passwordMustBe.tr();
  }
  return null;
}

String? validateFacebookLink(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourFacebook.tr();
  }
  final regex =
      RegExp(r'^(https?:\/\/)?(www\.)?facebook\.com\/[a-zA-Z0-9(\.\?)?]/');

  if (!regex.hasMatch(value)) {
    return AppStrings.pleaseEnterAValidFacebook.tr();
  }
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourAddress.tr();
  }
  return null;
}

String? validateShop(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourShopName.tr();
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseEnterYourPhoneNumber.tr();
  }
  if (value.length != 11) {
    return AppStrings.phoneNumberMustBe11.tr();
  }
  return null;
}

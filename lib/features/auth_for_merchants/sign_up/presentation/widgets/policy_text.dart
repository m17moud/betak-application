import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Styles.styleRegularInter16,
          children: [
            TextSpan(text: AppStrings.agreeToTerms.tr()),
            TextSpan(
              text: AppStrings.privacyPolicy.tr(),
              style: Styles.styleBoldInriaSans16.copyWith(
                color: Styles.blueSky,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse('https://policy-rosy.vercel.app/'));
                },
            ),
            TextSpan(text: AppStrings.ourPrivacy.tr()),
          ],
        ),
      ),
    );
  }
}

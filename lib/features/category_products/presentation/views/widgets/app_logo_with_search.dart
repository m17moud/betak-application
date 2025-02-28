import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class AppLogoWithSearch extends StatelessWidget {
  const AppLogoWithSearch({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      width: double.infinity,
      color: Styles.flyByNight,
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: height * .08,
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInRight(
              delay: const Duration(milliseconds: 500),
              child: CustomSearchTextField(
                screenWidth: width,
              )),
        ],
      ),
    );
  }
}

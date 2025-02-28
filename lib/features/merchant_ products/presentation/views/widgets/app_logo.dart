import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
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
            height: height * .1,
          ),
        ],
      ),
    );
  }
}

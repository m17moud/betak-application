import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 15),
      width: double.infinity,
      color: Styles.flyByNight,
      child: Image.asset(
        "assets/images/logo.png",
        height: height * .1,
      ),
    );
  }
}

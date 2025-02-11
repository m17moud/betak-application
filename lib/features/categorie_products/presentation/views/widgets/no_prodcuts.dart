
import 'package:betak/core/utils/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class noProducts extends StatelessWidget {
  const noProducts({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noProductsFound.tr(),
        style: TextStyle(
          fontSize: width * 0.05,
          color: Styles.flyByNight,
        ),
      ),
    );
  }
}
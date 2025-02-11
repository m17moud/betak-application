import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

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
            height: height * .08,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSearchTextField(screenWidth: width,),

        ],
      ),
    );
  }
}

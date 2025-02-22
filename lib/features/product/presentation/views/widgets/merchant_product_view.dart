import 'package:betak/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../category_products/data/models/products_model.dart';
import 'product_view_body.dart';


class MerchantProductView extends StatelessWidget {
  final ProductsModel productsModel;
  const MerchantProductView({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double paddingLeftRight = width * 0.05; // Equal padding for left and right
    double buttonHeight = height * 0.06;
    double iconSize = width * 0.1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.flyByNight,
        title: Text(
          productsModel.pname!,
          style: Styles.styleBoldIrinaSans20
              .copyWith(color: ColorManager.lightGrey, fontSize: width * 0.05),
        ),
      ),
      backgroundColor: ColorManager.white,
      body: ProductViewBody(
        productsModel: productsModel,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingLeftRight, vertical: height * 0.02),
        child: Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await launchUrl(Uri.parse(productsModel.seller!.facebookUrl!));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width * 0.85, buttonHeight),
                backgroundColor: Styles.blueSky,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Ensure the icon is centered vertically
                children: [
                  Icon(
                    Icons.facebook,
                    color: ColorManager.white,
                    size: iconSize,
                  ),
                  SizedBox(
                      width: width *
                          0.03), // Add some space between the icon and text
                  Text(
                    'التواصل عبر الفيسبوك',
                    style: Styles.styleBoldIrinaSans20
                        .copyWith(color: ColorManager.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

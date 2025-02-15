import '../../../../core/utils/color_manager.dart';
import '../../../categorie_products/data/models/products_model.dart';
import 'package:flutter/material.dart';

import 'widgets/product_view_body.dart';

// ignore: must_be_immutable
class ProductView extends StatelessWidget {
  ProductsModel productsModel;
   ProductView({super.key,required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.white,
      body: ProductViewBody(productsModel: productsModel),
    );
  }
}

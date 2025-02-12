import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:flutter/material.dart';

import 'widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  ProductsModel productsModel;
   ProductView({super.key,required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      body: ProductViewBody(productsModel: productsModel),
    );
  }
}

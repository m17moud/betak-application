import 'package:betak/features/product/presentation/views/widgets/product_view_body.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      body: ProductViewBody(),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:betak/features/category_products/presentation/cubit/category_products_cubit.dart';
import 'package:betak/features/merchant_%20products/presentation/cubit/merchant_products_cubit.dart';
import 'package:betak/injection_container.dart';

import '../../../category_products/data/models/products_model.dart';
import 'merhcant_products_for_client_view_body.dart';

// ignore: must_be_immutable
class MerhcantProductsForClientView extends StatelessWidget {
  bool isMerchant;
  String sellerId;
  Seller sellerModel;
  MerhcantProductsForClientView({
    super.key,
    required this.isMerchant,
    required this.sellerId,
    required this.sellerModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MerchantProductsCubit>(),
      child: BlocProvider(
        create: (context) =>sl<CategoryProductsCubit>(),
        child: Scaffold(
          body: MerhcantProductsForClientViewBody(
            isMerchant: isMerchant,
            sellerModel: sellerModel,
            sellerId: sellerId,
          ),
        ),
      ),
    );
  }
}

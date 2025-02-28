// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:betak/features/category_products/presentation/views/widgets/merchant_products_app_logo.dart';
import 'package:betak/features/merchant_%20products/presentation/cubit/merchant_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/loading_error.dart';
import '../../../category_products/data/models/products_model.dart';
import '../../../category_products/presentation/views/widgets/no_prodcuts.dart';
import '../../../category_products/presentation/views/widgets/products.dart';
import '../../../merchant_ products/presentation/views/widgets/categorie_title.dart';

// ignore: must_be_immutable
class MerhcantProductsForClientViewBody extends StatefulWidget {
  bool isMerchant ;
  String sellerId;
  Seller sellerModel;
  MerhcantProductsForClientViewBody({
    super.key,
    required this.sellerId,
    required this.isMerchant,
    required this.sellerModel,
  });

  @override
  State<MerhcantProductsForClientViewBody> createState() =>
      _MerchantProductsViewBodyState();
}

class _MerchantProductsViewBodyState
    extends State<MerhcantProductsForClientViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        FadeInDown(child: MerchantProductsAppLogo(height: height, width: width)),
        FadeInRight(
            child: CategorieTitle(
          departmentName: "منتجات التاجر ${widget.sellerModel.sname}",
          width: width,
          height: height,
        )),
        Expanded(
          child: BlocBuilder<MerchantProductsCubit, MerchantProductsState>(
            builder: (context, state) {
              if (state is MerchantProductsInitial) {
                context
                    .read<MerchantProductsCubit>()
                    .getProducts(widget.sellerId);
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is MerchantProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is MerchantProductsSuccess) {
                List<ProductsModel> products = state.departmentProducts;

                if (products.isEmpty) {
                  return FadeInUp(child: NoProducts(width: width));
                }

                return FadeInLeft(
                  child: Products(
                isMerchant:  widget.isMerchant   ,
                    width: width,
                    height: height,
                    departmentProducts: products,
                  ),
                );
              }

              if (state is MerchantProductsError) {
                return FadeInUp(
                  child: Center(
                    child: LoadingError(
                        text: AppStrings.productsError,
                        onPressed: () {
                          context
                              .read<MerchantProductsCubit>()
                              .getProducts(widget.sellerId);
                        }),
                  ),
                );
              }

              if (state is MerchantProductsNoResults) {
                return FadeInUp(child: NoProducts(width: width));
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

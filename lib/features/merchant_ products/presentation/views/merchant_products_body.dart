import 'package:animate_do/animate_do.dart';
import '../../../auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import '../../../category_products/data/models/products_model.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/widgets/loading_error.dart';
import '../cubit/merchant_products_cubit.dart';
import 'widgets/app_logo.dart';
import 'widgets/categorie_title.dart';
import 'widgets/no_prodcuts.dart';
import 'widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import '../../../../injection_container.dart';

class MerchantProductsViewBody extends StatefulWidget {
  const MerchantProductsViewBody({super.key});

  @override
  State<MerchantProductsViewBody> createState() =>
      _MerchantProductsViewBodyState();
}

class _MerchantProductsViewBodyState extends State<MerchantProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<MerchantLoginCubit>()..checkAuthStatus(),
      child: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
        builder: (context, state) {
          if (state is LoggedIn) {
            var sellerData = state.merchantInfo;

            return Column(
              children: [
                FadeInDown(child: AppLogo(height: height, width: width)),
                FadeInRight(
                    child: CategorieTitle(
                  departmentName: AppStrings.myProducts.tr(),
                  width: width,
                  height: height,
                )),
                Expanded(
                  child: BlocProvider(
                    create: (context) => sl<MerchantProductsCubit>(),
                    child: BlocBuilder<MerchantProductsCubit,
                        MerchantProductsState>(
                      builder: (context, state) {
                        if (state is MerchantProductsInitial) {
                          context
                              .read<MerchantProductsCubit>()
                              .getProducts(sellerData.SellerID!);
                          return const Center(
                            child: CircularProgressIndicator(
                                color: Styles.blueSky),
                          );
                        }

                        if (state is MerchantProductsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: Styles.blueSky),
                          );
                        }

                        if (state is MerchantProductsSuccess) {
                          List<ProductsModel> products =
                              state.departmentProducts;

                          if (products.isEmpty) {
                            return FadeInUp(child: NoProducts(width: width));
                          }

                          return FadeInLeft(
                            child: Products(
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
                                        .getProducts(sellerData.SellerID!);
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
                ),
              ],
            );
          }

          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Styles.blueSky,
              ),
            );
          } else {
            return Center(
              child: Text(AppStrings.errorLoginAgain.tr()),
            );
          }
        },
      ),
    );
  }
}

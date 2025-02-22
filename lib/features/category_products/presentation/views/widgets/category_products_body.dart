import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/loading_error.dart';
import '../../../../home/data/models/home_department_response_model.dart';
import '../../../data/models/products_model.dart';
import '../../cubit/category_products_cubit.dart';
import 'app_logo.dart';
import 'category_title.dart';
import 'no_prodcuts.dart';
import 'products.dart';

class CategoryProductsViewBody extends StatefulWidget {
  final HomeDepartmentResponseModel departmentResponseModel;

  const CategoryProductsViewBody(this.departmentResponseModel, {super.key});

  @override
  State<CategoryProductsViewBody> createState() =>
      _CategoryProductsViewBodyState();
}

class _CategoryProductsViewBodyState extends State<CategoryProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        FadeInDown(child: AppLogo(height: height, width: width)),
        FadeInRight(
          child: CategoryTitle(
            departmentName: widget.departmentResponseModel.name!,
            width: width,
            height: height,
          ),
        ),
        Expanded(
          child: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
            builder: (context, state) {
              if (state is CategoryProductsInitial) {
                context
                    .read<CategoryProductsCubit>()
                    .getProducts(widget.departmentResponseModel.id!);
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is CategoryProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is CategoryProductsSuccess) {
                List<ProductsModel> products = state.departmentProducts;

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

              if (state is CategoryProductsError) {
                return FadeInUp(
                  child: Center(
                    child: LoadingError(
                        text: AppStrings.productsError,
                        onPressed: () {
                          context
                              .read<CategoryProductsCubit>()
                              .getProducts(widget.departmentResponseModel.id!);
                        }),
                  ),
                );
              }

              if (state is CategoryProductsNoResults) {
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

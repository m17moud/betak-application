import 'package:animate_do/animate_do.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/widgets/loading_error.dart';
import '../../../data/models/products_model.dart';
import '../../cubit/categorie_products_cubit.dart';
import 'app_logo.dart';
import 'categorie_title.dart';
import 'no_prodcuts.dart';
import 'products.dart';
import '../../../../home/data/models/home_department_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';

class CategorieProductsViewBody extends StatefulWidget {
  final HomeDepartmentResponseModel departmentResponseModel;

  const CategorieProductsViewBody(this.departmentResponseModel, {super.key});

  @override
  State<CategorieProductsViewBody> createState() =>
      _CategorieProductsViewBodyState();
}

class _CategorieProductsViewBodyState extends State<CategorieProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        FadeInDown(child: AppLogo(height: height, width: width)),
        FadeInRight(
          child: CategorieTitle(
            departmentName: widget.departmentResponseModel.name!,
            width: width,
            height: height,
          ),
        ),
        Expanded(
          child: BlocBuilder<CategorieProductsCubit, CategorieProductsState>(
            builder: (context, state) {
              if (state is CategorieProductsInitial) {
                context
                    .read<CategorieProductsCubit>()
                    .getProducts(widget.departmentResponseModel.id!);
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is CategorieProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Styles.blueSky),
                );
              }

              if (state is CategorieProductsSuccess) {
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

              if (state is CategorieProductsError) {
                return FadeInUp(
                  child: Center(
                    child: LoadingError(
                        text: AppStrings.productsError,
                        onPressed: () {
                          context.read<CategorieProductsCubit>().getProducts(widget.departmentResponseModel.id!);
                        }),
                  ),
                );
              }

              if (state is CategorieProductsNoResults) {
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

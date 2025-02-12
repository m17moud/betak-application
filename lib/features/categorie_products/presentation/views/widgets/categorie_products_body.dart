
import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/presentation/cubit/categorie_products_cubit.dart';
import 'package:betak/features/categorie_products/presentation/views/widgets/app_logo.dart';
import 'package:betak/features/categorie_products/presentation/views/widgets/categorie_title.dart';
import 'package:betak/features/categorie_products/presentation/views/widgets/no_prodcuts.dart';
import 'package:betak/features/categorie_products/presentation/views/widgets/products.dart';
import 'package:betak/features/home/data/models/home_department_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';


class CategorieProductsViewBody extends StatefulWidget {
  final HomeDepartmentResponseModel departmentResponseModel;

  CategorieProductsViewBody(this.departmentResponseModel);

  @override
  State<CategorieProductsViewBody> createState() =>
      _CategorieProductsViewBodyState();
}

class _CategorieProductsViewBodyState
    extends State<CategorieProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        AppLogo(height: height, width: width),
        CategorieTitle(
          departmentName: widget.departmentResponseModel.name!,
          width: width,
          height: height,
        ),
        Expanded(
          child: BlocBuilder<CategorieProductsCubit, CategorieProductsState>(
            builder: (context, state) {
              if (state is CategorieProductsInitial) {
                context.read<CategorieProductsCubit>().getProducts(widget.departmentResponseModel.id!);
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
                  return noProducts(width: width);
                }

                return Products(
                  width: width,
                  height: height,
                  departmentProducts: products,
                );
              }

              if (state is CategorieProductsError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      color: Styles.softPillow,
                    ),
                  ),
                );
              }

              if (state is CategorieProductsNoResults) {
                return noProducts(width: width);

              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}



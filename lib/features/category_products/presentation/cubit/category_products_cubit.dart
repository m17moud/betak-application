import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/end_ponits.dart';
import '../../data/models/products_model.dart';
import '../../domain/usecases/products_usecase.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final ProductsUsecase productsUsecase;

  // Store all products for search functionality
  List<ProductsModel> allProducts = [];

  CategoryProductsCubit({required this.productsUsecase})
      : super(CategoryProductsInitial());

  Future<void> getProducts(String depID) async {
    emit(CategoryProductsLoading());
    final failureOrLogin = await productsUsecase.call(
      Params(
        pkey: ApiConstants.selectProductsPKey,
        depID: depID,
        idType: "depr_id"
      ),
    );

    failureOrLogin.fold(
          (failure) {
        emit(CategoryProductsError(message: failure.message));
      },
          (departmentProducts) {
        allProducts = departmentProducts; // Store all products
        emit(CategoryProductsSuccess(departmentProducts: departmentProducts));
      },
    );
  }

  // Filter products by search query
  void searchProducts(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all products again
      emit(CategoryProductsSuccess(departmentProducts: allProducts));
    } else {
      final filteredProducts = allProducts
          .where((product) => product.pname!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filteredProducts.isEmpty) {
        emit(CategoryProductsNoResults());
      } else {
        // If products are found, emit the filtered products
        emit(CategoryProductsSuccess(departmentProducts: filteredProducts));
      }
    }
  }
}

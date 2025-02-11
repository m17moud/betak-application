import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/domain/usecases/products_usecase.dart';

import '../../../../core/api/end_ponits.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'categorie_products_state.dart';

class CategorieProductsCubit extends Cubit<CategorieProductsState> {
  final ProductsUsecase productsUsecase;

  // Store all products for search functionality
  List<ProductsModel> allProducts = [];

  CategorieProductsCubit({required this.productsUsecase})
      : super(CategorieProductsInitial());

  Future<void> getProducts(String depID) async {
    emit(CategorieProductsLoading());
    final failureOrLogin = await productsUsecase.call(
      Params(
        pkey: ApiConstants.selectProductsPkey,
        depID: depID,
      ),
    );

    failureOrLogin.fold(
          (failure) {
        emit(CategorieProductsError(message: failure.message));
      },
          (departmentProducts) {
        allProducts = departmentProducts; // Store all products
        emit(CategorieProductsSuccess(departmentProducts: departmentProducts));
      },
    );
  }

  // Filter products by search query
  void searchProducts(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all products again
      emit(CategorieProductsSuccess(departmentProducts: allProducts));
    } else {
      final filteredProducts = allProducts
          .where((product) => product.pname!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filteredProducts.isEmpty) {
        emit(CategorieProductsNoResults());
      } else {
        // If products are found, emit the filtered products
        emit(CategorieProductsSuccess(departmentProducts: filteredProducts));
      }
    }
  }
}

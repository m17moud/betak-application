

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../category_products/data/models/products_model.dart';
import '../../../category_products/domain/usecases/products_usecase.dart';

part 'merchant_products_state.dart';

class MerchantProductsCubit extends Cubit<MerchantProductsState> {
  final ProductsUsecase productsUsecase;

  // Store all products for search functionality
  List<ProductsModel> allProducts = [];

  MerchantProductsCubit({required this.productsUsecase})
      : super(MerchantProductsInitial());

  Future<void> getProducts(String merchantID) async {
    emit(MerchantProductsLoading());
    final failureOrLogin = await productsUsecase.call(
      Params(
        idType: "seller_id",
        pkey: ApiConstants.selectProductsPkey,
        depID: merchantID,
      ),
    );

    failureOrLogin.fold(
          (failure) {
        emit(MerchantProductsError(message: failure.message));
      },
          (departmentProducts) {
        allProducts = departmentProducts;
// Store all products
        emit(MerchantProductsSuccess(departmentProducts: departmentProducts));
      },
    );
  }

  // Filter products by search query
  void searchProducts(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all products again
      emit(MerchantProductsSuccess(departmentProducts: allProducts));
    } else {
      final filteredProducts = allProducts
          .where((product) => product.pname!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filteredProducts.isEmpty) {
        emit(MerchantProductsNoResults());
      } else {
        // If products are found, emit the filtered products
        emit(MerchantProductsSuccess(departmentProducts: filteredProducts));
      }
    }
  }
}

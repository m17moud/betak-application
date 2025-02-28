

import '../../../../core/utils/string_manager.dart';
import '../../../category_products/domain/usecases/products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/add_product_usecase.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUsecase addProductUsecase;
  final ProductsUsecase productsUsecase;
  AddProductCubit({required this.addProductUsecase,required this.productsUsecase})
      : super(AddProductInitial());
  Future<int> getProducts(String merchantID) async {
    final failureOrLogin = await productsUsecase.call(
      Params(
        idType: "seller_id",
        pkey: ApiConstants.selectProductsPkey,
        depID: merchantID,
      ),
    );

    return failureOrLogin.fold(
          (failure) {
        emit(AddProductError(message: failure.message));
        return 0;
      },
          (departmentProducts) => departmentProducts.length,
    );
  }
  Future<void> addProduct(
      final String did,
      final String name,
      final String price,
      final String sid,
      final String description,
      final List<XFile?> image) async {

    int productCount = await getProducts(sid);

    if (productCount >= 20) {
      emit(ProductSizeError(message: AppStrings.productSizeError.tr()));
      return;
    }

    List<MultipartFile> imageFiles = [];
    for (var img in image) {
      var file = await MultipartFile.fromFile(img!.path, filename: img.name);
      imageFiles.add(file);
    }

    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.addProductPKey,
      'did': did,
      'name': name,
      'price': price,
      'sid': sid,
      'description': description,
      'image[]': imageFiles,
    });

    emit(AddProductLoading());

    final failureOrLogin = await addProductUsecase.call(formData);

    failureOrLogin.fold(
          (failure) => emit(AddProductError(message: failure.message)),
          (success) => emit(AddProductSuccess()),
    );
  }

}

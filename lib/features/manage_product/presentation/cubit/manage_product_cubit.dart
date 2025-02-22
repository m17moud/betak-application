

import '../../domain/usecases/delete_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/update_product_usecase.dart';

part 'manage_product_state.dart';

class ManageProductCubit extends Cubit<ManageProductState> {
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;


  ManageProductCubit({required this.updateProductUsecase,required this.deleteProductUsecase})
      : super(UpdateProductInitial());

  Future<void> updateProduct(
      final String pid,
      final String name,
      final String price,
      final String sid,
      final String description,
      final List<XFile?> image) async {
    // Convert XFile to MultipartFile
    List<MultipartFile> imageFiles = [];
    for (var img in image) {
      // You can also check mimeType here if needed
      var file = await MultipartFile.fromFile(img!.path, filename: img.name);
      imageFiles.add(file);
    }

    // Add the converted files to FormData
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.updateProductsPkey,
      ApiConstants.tp: ApiConstants.updateProductsTP,
      'id':pid,
      'name': name,
      'price': price,
      'uid': sid,
      'description': description,
      'image[]': imageFiles, // Send the image files as part of the form data
    });

    emit(UpdateProductLoading());

    final failureOrLogin = await updateProductUsecase.call(formData);

    failureOrLogin.fold(
      (failure) => emit(UpdateProductError(message: failure.message)),
      (success) => emit(UpdateProductSuccess()),
    );
  }

  Future<void> deleteProduct(
      final String pid,
      final String sid,
     ) async {

    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.deleteProductsPkey,
      ApiConstants.tp: ApiConstants.deleteProductsTP,
      'pid':pid,
      'uid': sid, 
    });

    emit(DeleteProductLoading());

    final failureOrLogin = await deleteProductUsecase.call(formData);

    failureOrLogin.fold(
          (failure) => emit(DeleteProductError(message: failure.message)),
          (success) => emit(DeleteProductSuccess()),
    );
  }

}

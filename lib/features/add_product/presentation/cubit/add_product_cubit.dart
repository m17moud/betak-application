

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/add_product_usecase.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUsecase addProductUsecase;

  AddProductCubit({required this.addProductUsecase})
      : super(AddProductInitial());

  Future<void> addProduct(
      final String did,
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
      ApiConstants.pKey: ApiConstants.addProductPKey,
      'did': did,
      'name': name,
      'price': price,
      'sid': sid,
      'description': description,
      'image[]': imageFiles, // Send the image files as part of the form data
    });

    emit(AddProductLoading());

    final failureOrLogin = await addProductUsecase.call(formData);

    failureOrLogin.fold(
      (failure) => emit(AddProductError(message: failure.message)),
      (success) => emit(AddProductSuccess()),
    );
  }
}

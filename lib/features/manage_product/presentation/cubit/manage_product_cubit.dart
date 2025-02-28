

import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
part 'manage_product_state.dart';

class ManageProductCubit extends Cubit<ManageProductState> {
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;


  ManageProductCubit({required this.updateProductUsecase,required this.deleteProductUsecase})
      : super(UpdateProductInitial());
// Convert URLs to XFile before updating the product
  Future<List<XFile>> convertUrlsToXFiles(List<String> imageUrls) async {
    List<XFile> finalImages = [];

    for (String imageUrl in imageUrls) {
      try {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final tempDir = await getTemporaryDirectory();
          final file = File('${tempDir.path}/${imageUrl.split('/').last}');
          await file.writeAsBytes(response.bodyBytes);
          finalImages.add(XFile(file.path));
        }
      } catch (e) {
        emit(UpdateProductError( message: e.toString()));
      }
    }
    return finalImages;
  }
  Future<void> updateProduct(
      final String pid,
      final String name,
      final String price,
      final String sid,
      final String description,
      final List<String> existingImageUrls,
      final List<XFile?> image) async {
    List<XFile> finalImages = await convertUrlsToXFiles(existingImageUrls);
    finalImages.addAll(image as Iterable<XFile>);

    List<MultipartFile> imageFiles = [];
    for (var img in finalImages) {
      var file = await MultipartFile.fromFile(img.path, filename: img.name);
      imageFiles.add(file);
    }

    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.updateProductsPkey,
      ApiConstants.tp: ApiConstants.updateProductsTP,
      'id':pid,
      'name': name,
      'price': price,
      'uid': sid,
      'description': description,
      'image[]': imageFiles,
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

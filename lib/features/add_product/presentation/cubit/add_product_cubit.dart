import '../../domain/usecases/add_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_ponits.dart';

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
      final XFile image) async {
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.addProductPKey,
      'name': name,
      'did': did,
      'price': price,
      'sid': sid,
      'description': description,
      'image': image,
    });
    emit(AddProductLoading());
    final failureOrLogin = await addProductUsecase.call(formData);

    failureOrLogin.fold(
      (failure) => emit(AddProductError(message: failure.message)),
      (success) => emit(AddProductSuccess()),
    );
  }
}

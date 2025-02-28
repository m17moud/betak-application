import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/add_like_usecase.dart';

part 'add_like_state.dart';

class AddLikeCubit extends Cubit<AddLikeState> {
  final AddLikeUsecase addLikeUsecase;

  AddLikeCubit({required this.addLikeUsecase}) : super(AddLikeInitial());

  Future<void> addLike(final String customerId, final String productId) async {
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.addLikePKey,
      'customer_id': customerId,
      'product_id': productId,
    });

    emit(AddLikeLoading());

    final failureOrLogin = await addLikeUsecase.call(formData);

    failureOrLogin.fold(
      (failure) => emit(AddLikeError(message: failure.message)),
      (success) => emit(AddLikeSuccess()),
    );
  }

  Future<void> checkLike(
      final String customerId, final String productId) async {
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.checkLikePKey,
      'customer_id': customerId,
      'product_id': productId,
    });

    emit(CheckLikeLoading());

    final failureOrLogin = await addLikeUsecase.callCheckLike(formData);

    failureOrLogin.fold(
      (failure) => emit(CheckLikeError(message: failure.message)),
      (response) => emit(CheckLikeSuccess(checkLikeResponse: response)),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../domain/usecases/add_merchant_usecase.dart';

part 'merchant_sign_up_state.dart';

class MerchantSignUpCubit extends Cubit<MerchantSignUpState> {
  final AddMerchantUsecase addMerchantUsecase;

  MerchantSignUpCubit({required this.addMerchantUsecase})
      : super(MerchantSignUpInitial());

  Future<void> signup(
      String name,
      String email,
      String password,
      String phone,
      String address,
      String productsType,
      String shop,
      String departmentId,
      String facebookUrl) async {
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.merchantSignUpPKey,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'productsType': productsType,
      'shop': shop,
      'facebookUrl': facebookUrl,
      'did':departmentId,
    });

    emit(MerchantSignUpLoading());

    final failureOrSignup = await addMerchantUsecase.call(formData);

    failureOrSignup.fold(
      (failure) => emit(MerchantSignUpError(message: failure.message)),
      (success) => emit(MerchantSignUpSuccess()),
    );
  }
}

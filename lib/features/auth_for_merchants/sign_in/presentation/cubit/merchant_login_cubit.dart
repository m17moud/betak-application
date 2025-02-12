import 'dart:convert';

import '../../data/models/merchant_login_response_model.dart';
import '../../domain/usecases/merchant_login_usecase.dart';
import '../../domain/usecases/merchant_logout_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';


part 'merchant_login_state.dart';

class MerchantLoginCubit extends Cubit<MerchantLoginState> {
  final MerchantLoginUsecase merchantLogin;
  final MerchantLogoutUseCase merchantLogout;

  MerchantLoginCubit(
      {required this.merchantLogin, required this.merchantLogout})
      : super(MerchantLoginInitial());

  /// Handles user login logic.
  Future<void> login(String email, String password) async {
    emit(Loading());
    final failureOrLogin = await merchantLogin.call(Params(
        pkey: ApiConstants.merchantSignInPKey,
        loginemail: email,
        loginpassword: password));

    failureOrLogin.fold(
      (failure) => emit(LoginError(message: failure.message)),
      (merchantInfo) => emit(LoggedIn(merchantInfo: merchantInfo)),
    );
  }

  /// Handles user logout logic.
  Future<void> logoutUser() async {
    emit(Loading());
    try {
      final result = await merchantLogout.call(NoParams());
      if (result != const Left(NetworkFailure())) {
        emit(LoggedOut());
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  /// Checks if the user is already authenticated.
  Future<void> checkAuthStatus() async {
    emit(Loading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
          await secureStorage.read(key: Constants.merchantSecureStorage);

      if (authJson != null) {
        emit(LoggedIn(
          merchantInfo:
          MerchantLoginResponseModel.fromJson(jsonDecode(authJson)),
        ));
      } else {
        emit(LoggedOut());
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}

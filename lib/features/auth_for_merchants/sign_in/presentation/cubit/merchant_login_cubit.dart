// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/features/auth_for_merchants/merhcant_check_session/data/models/merchant_payment_model.dart';
import 'package:betak/features/auth_for_merchants/merhcant_check_session/domain/usecases/merchant_payment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../data/models/merchant_login_response_model.dart';
import '../../domain/usecases/merchant_login_usecase.dart';
import '../../domain/usecases/merchant_logout_usecase.dart';

part 'merchant_login_state.dart';

class MerchantLoginCubit extends Cubit<MerchantLoginState> {
  final MerchantLoginUsecase merchantLogin;
  final MerchantLogoutUseCase merchantLogout;
  final MerchantPaymentUsecase merchantPaymentUsecase;

  MerchantLoginCubit(
      {required this.merchantLogin,
      required this.merchantLogout,
      required this.merchantPaymentUsecase})
      : super(MerchantLoginInitial());

  /// Handles user login logic.
  Future<void> login(String email, String password) async {
    emit(Loading());
    final failureOrLogin = await merchantLogin.call(Params(
        pkey: ApiConstants.merchantSignInPKey,
        loginemail: email,
        loginpassword: password));

    failureOrLogin.fold(
      (failure) {
        if (failure is PaymentRequiredFailure) {
          emit(MerchantPaymentRequiredFailure(message: failure.message.tr()));
        } else if (failure is PaymentAfterSignUpRequiredFailure) {
          emit(
              MerchantPaymentAfterSignUpFailure(message: failure.message.tr()));
        } else {
          emit(MerchantLoginError(message: failure.message));
        }
      },
      (merchantInfo) => emit(MerchantLoggedIn(merchantInfo: merchantInfo)),
    );
  }

  /// Handles user logout logic.
  Future<void> logoutUser() async {
    emit(Loading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
          await secureStorage.read(key: Constants.merchantSecureStorage);
      if (authJson != null) {
        final merchantData =
            MerchantLoginResponseModel.fromJson(jsonDecode(authJson));

        final result = await merchantLogout.call(Parameters(
            pkey: ApiConstants.logoutPKey,
            tp: ApiConstants.logoutSellerTP,
            id: merchantData.SellerID!));
        if (result != const Left(NetworkFailure())) {
          emit(MerchantLoggedOut());
        } else {
          emit(MerchantLoginError(
              message: AppStrings.locNetworkErrorDescription.tr()));
        }
      } else {
        emit(MerchantLoginError(message: AppStrings.error.tr()));
      }
    } catch (e) {
      emit(MerchantLoginError(message: e.toString()));
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
        emit(MerchantLoggedIn(
          merchantInfo:
              MerchantLoginResponseModel.fromJson(jsonDecode(authJson)),
        ));
      } else {
        emit(MerchantLoggedOut());
      }
    } catch (e) {
      emit(MerchantLoginError(message: e.toString()));
    }
  }

  Future<void> merchantPayment(String email) async {
    emit(MerchantPaymentLoading());

    final failureOrLogin = await merchantPaymentUsecase.call(
        MerchantPaymentParameters(
            pkey: ApiConstants.paymentPKey,
            tp: ApiConstants.paymentSellerTP,
            email: email));
    failureOrLogin.fold(
      (failure) {
        if (failure is NetworkFailure) {
          emit(MerchantPaymentNetworkFailure(message: failure.message));
        } else {
          emit(MerchantPaymentFailure(message: failure.message));
        }
      },
      (payment) => emit(MerchantPaymentSuccess(paymentURL: payment)),
    );
  }
}
